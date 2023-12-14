//+------------------------------------------------------------------+
//|                                            SimpleMovingAverage |
//|                        Generated by                       |
//+------------------------------------------------------------------+
#property strict

// Definir parâmetros das médias móveis
input int fastMAPeriod = 10;
input int slowMAPeriod = 20;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Adicionar uma média móvel rápida ao gráfico
   int fastMA_handle = iMA(_Symbol, 0, fastMAPeriod, 0, MODE_SMA, PRICE_CLOSE);
   if(fastMA_handle == INVALID_HANDLE)
     {
      Print("Erro ao adicionar a média móvel rápida. Código de erro: ", GetLastError());
      return(INIT_FAILED);
     }

   // Adicionar uma média móvel lenta ao gráfico
   int slowMA_handle = iMA(_Symbol, 0, slowMAPeriod, 0, MODE_SMA, PRICE_CLOSE);
   if(slowMA_handle == INVALID_HANDLE)
     {
      Print("Erro ao adicionar a média móvel lenta. Código de erro: ", GetLastError());
      return(INIT_FAILED);
     }

   // Retorno bem-sucedido da inicialização
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   // Obter os valores das médias móveis
   double fastMA_value = iMA(_Symbol, 0, fastMAPeriod, 0, MODE_SMA, PRICE_CLOSE, 0);
   double slowMA_value = iMA(_Symbol, 0, slowMAPeriod, 0, MODE_SMA, PRICE_CLOSE, 0);

   // Verificar as condições de negociação
   if(fastMA_value > slowMA_value)
     {
      // Condição de compra: Média rápida acima da média lenta
      // Coloque aqui a lógica para abrir uma posição de compra
      Print("Condição de compra. Implemente a lógica de compra aqui.");
     }
   else if(fastMA_value < slowMA_value)
     {
      // Condição de venda: Média rápida abaixo da média lenta
      // Coloque aqui a lógica para abrir uma posição de venda
      Print("Condição de venda. Implemente a lógica de venda aqui.");
     }
  }
//+------------------------------------------------------------------+
