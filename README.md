# soa-osb-puc

## Enunciado

- Crie um proxy dentro do diretório proxies chamado CreditoGeralService.proxy;
- Esse proxy deve fazer a orquestração de todas as operações. Portando, envie os parâmetros necessários;

- Deve-se seguir a regra:
   - Se o crédito externo for maior de 400, retornar score 200;
   - Se o crédito interno tiver no máximo 3 restrições e que não somem 200, retornar retornar score 500;
   - Senão, se valor for superior a 200 e indica whiteList,retornar score 900;
   - Se o crédito interno tiver mais de 4 restrições, retornarscore 0;
   
- Lembre-se de utilizar o route para a última orquestração;
- O transporte deste serviços deve ser HTTP;
- Crie um fluxo de testes via SOAP-UI para testar todos os cenários.

## Observações

 - Caso não as restrições não se apliquem a nenhuma das 4 regras, o score é retornado vazio ("");
 - O serviço de pessoa foi implementado também no osb associado a um endpoind do mock do SOAPUI;
 - Os arquivos do SOAPUI estão nos seguintes diretórios: [Crédito](https://github.com/renatorp/soa-osb-puc/tree/master/OSB_RenatoRibeiro/EBS/Credito/teste) [Pessoa](https://github.com/renatorp/soa-osb-puc/tree/master/OSB_RenatoRibeiro/EBS/Pessoa/teste);
 - Foi criado um mock response para cada valor de score possível de ser retornado.
