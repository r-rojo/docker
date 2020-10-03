FROM opae/fedora-builder
RUN dnf install -y neovim python2
RUN pip install pynvim
RUN useradd -s /bin/bash -g wheel rrojo
USER rrojo
RUN mkdir -p /home/rrojo/.config/nvim && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY init.vim /home/rrojo/.config/nvim/.
USER root
ENTRYPOINT [ "/bin/bash" ]
