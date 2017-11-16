Este é um projeto em MATLAB cujo objetivo é criar um mapa de disparidades a partir de uma cena real, capturada por um par de câmeras, usando calibração (o método de Zhang). O mapa de disparidades é um mapa que exibe a profundidade dos elementos presentes em uma cena. 

---------------------------------------------------------------------------------------------------------------------------------

Materiais utilizados:

- MATLAB R2014b, versão x64: https://www.mathworks.com/products/matlab.html
- Minoru 3D Webcam (opcional): http://www.minoru3d.com/
- Um padrão de calibração, impresso em uma superfície plana.

Como confirgurar o MATLAB:

1) Abra o MATLAB (duh);

2) Digite o comando supportPackageInstaller no console do MATLAB e pressione Enter;

3) Uma vez que o Package Installer Manager esteja aberto, marque estas duas bibliotecas para serem instaladas:
	- USB Webcam;
	- OS Generic Video Interface;

4) Configure o caminho do MATLAB para a pasta que contém o projeto baixado (provavelmente a pasta deste arquivo);

5) Encontre o ID (é um número, geralmente 1 e 2 para as câmeras esquerda e direita) de cada webcam a ser utilizada e mude os valores de LEFT_CAM/RGHT_CAM com os ID's de cada uma. Se você deseja realizar uma calibração inicial, mude também o valor de USE_ZHANG_CL para 1;

6) Divirta-se!

Você provavelmente precisará de uma conta no MATLAB para baixar e instalar os pacotes necessários (é de graça).

Dúvidas podem ser resolvidas por meio do meu e-mail: carloswdecarvalho@outlook.com.

---------------------------------------------------------------------------------------------------------------------------------
