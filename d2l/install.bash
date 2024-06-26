~/miniconda3/bin/conda init
conda create --name d2l python=3.9 -y
conda activate d2l
pip install torch==1.12.0 -i https://pypi.tuna.tsinghua.edu.cn/simple
pip install torchvision==0.13.0 -i https://pypi.tuna.tsinghua.edu.cn/simple
pip install d2l==0.17.6 -i https://pypi.tuna.tsinghua.edu.cn/simple
mkdir d2l-zh && cd d2l-zh
curl https://zh-v2.d2l.ai/d2l-zh-2.0.0.zip -o d2l-zh.zip
unzip d2l-zh.zip && rm d2l-zh.zip
cd pytorch

