FROM ansible/ubuntu14.04-ansible

# Disable SSH host key checking for ESXi clones & interactive username/password
ENV ANSIBLE_HOST_KEY_CHECKING=False

# Add sshpass for interactive execution`
RUN apt-get install -y sshpass \ 
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/*
