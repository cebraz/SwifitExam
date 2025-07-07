O projeto tem como intuito demonstrar algumas das habilidades adquiridas durante o desenvolvimento de um aplicativo iOS 
para leitura e manipulação de imagens, com a funcionalidade drag-n-drop.

Tecnologias utilizadas:

Para a leitura e exibição das imagens foi utilizado o PhotosUI
Para o drag-n-drop foi necessario utiliar o protocolo transferable em conjunto com os métodos onDrag e dropDestination para a validação das movimentações.

Estrutura: O projeto foi dividido na medida do possivel em algumas pastas, o transferable está localizado na pasta models, 
e o contentView está localizado na pasta ui.

Instruções para execução:

Clonar o repositorio com o comando `git clone git@github.com:cebraz/SwifitExam.git`
Utilizar o emulador de iphone 16 Pro
Basicamente, quando for executada a aplicação, uma tela branca com um botão para adicionar imagens. 
Após clicar no botão, uma tela com a biblioteca de imagens do emulador, será exibida e será possivel selecionar multiplas imagens. 
Após selecionar as imagens, e confirmá-las, a tela renderizará todas as imagens selecionadas. Quando pressionar alguma imagem e manter pressionada por alguns segundos, é possivel arrastá-la.

A funcionalidade de exibir som ao clicar na imagem e o o pop-up não foram desenvolvidos.
