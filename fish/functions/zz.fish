function zz
    if [ -f ${HOME}/.zshrc ]
        then
        vim ${HOME}/.zshrc
    else
        vim ${HOME}/.bashrc
    fi
end
