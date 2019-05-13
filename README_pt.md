# Sistema de Visão Estéreo Calibrado em MATLAB

Este projeto exibe um modelo básico de como criar um mapa de disparidades a partir de uma cena real, em conjunto com um par de câmeras, usando calibração (pelo método de Zhang). Se você está procurando a versão sem calibração, ela está disponível [neste link](https://github.com/Carzuilha/MATLAB-SimpleStereoVisionSystem).

## Introdução

Um **mapa de disparidades** é uma representação gráfica da profundidade de elementos que estão presentes em uma cena. Os mapas de disparidade costumam ser muito utilizados na área de visão estéreo, em que tenta-se reproduzir computacionalmente aspectos da visão humana. Basicamente, a geração de um mapa de disparidades envolve até 3 (três) etapas:

 - A **calibração**, que ao avaliar características das câmeras de um sistema de visão estéreo, busca parâmetros importantes à geração de um mapa de disparidades;
 - A **retificação**, em que os parâmetros obtidos na etapa anterior são utilizados como referência no processo de captura (e posteriormente ajuste) das imagens de uma cena;
 - A **correspondência**, que parte das imagens obtidas pelo processo de retificação para gerar o mapa de disparidades.

Embora existam muitas técnicas para retificação e correspondência, na maioria das vezes a calibração é realizada utilizando o tradicional método de Zhang [[1](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/tr98-71.pdf)], que utiliza um elemento (semelhante a um tabuleiro de xadrez) como referência para a calibração das câmeras do sistema de visão estéreo. É o que este projeto faz.

## Materiais Utilizados

- [**MATLAB R2017b**](https://www.mathworks.com/products/matlab.html) ou posterior, versão x64.
- Uma **câmera 3D**, ou um **par de cameras** simulando um sistema de visão estéreo. No caso, eu utilizo a [Minoru3D](http://www.minoru3d.com/).
- Um "padrão de calibração". Na prática, um molde de tabuleiro de xadrez, impresso em um plano. Você pode gerar um padrão destes no [calib.io](https://calib.io/pages/camera-calibration-pattern-generator).

## Como Configurar o MATLAB

1. Abra o MATLAB;

2. Digite o comando `supportPackageInstaller` no console do MATLAB e pressione _Enter_;

3. Uma vez que o _Package Installer Manager_ esteja aberto, instale essas duas bibliotecas:

	- "`USB Webcam`", que permite ao MATLAB reconhecer câmeras USB;
	- "`OS Generic Video Interface`", que permite ao MATLAB capturar imagens com as câmeras USB.
	
4. Configure o caminho do MATLAB para a pasta que contém este projeto;

5. Agora a parte complicada. Você precisa encontrar o `ID` de cada câmera que será utilizada no projeto. Se você tiver apenas duas câmeras no seu computador, provavelmente as `ID`'s terão valor 1 (um) para a câmera esquerda e 2 (dois) para a câmera direita. Se você possuir 3 (três) ou mais câmeras conectadas no seu computador, recomendo digitar o comando `webcamlist` no console do MATLAB, pressionar _Enter_ e ver o que aparece (as câmeras aparecerão na order do `ID` destas). 

6. Uma vez descoberto o `ID` de cada câmera, mude os valores de `LEFT_CAM`/`RGHT_CAM` no arquivo [main.m](sources/main.c) com o `ID` de cada uma;

	- (Opcional) Se você deseja realizar uma calibração inicial das cãmeras, mude também o valor de `USE_CALIBRATION` para 1 (um);

7. Por fim, você pode executar o arquivo [main.m](sources/main.c) no MATLAB.

## Informações Adicionais

Você pode precisar de uma conta no MATLAB (não se preocupe, esta é gratuita) para baixar e instalar os pacotes necessários da etapa 3 (três).

## Licença de Uso

Os códigos disponibilizados aqui estão sob a licença do MIT, versão 3.0 (veja o arquivo `LICENSE` em anexo para mais detalhes). Dúvidas sobre este projeto podem ser enviadas para o meu e-mail: carloswdecarvalho@outlook.com.
