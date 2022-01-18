# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dimioui <dimioui@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/18 14:20:53 by dimioui           #+#    #+#              #
#    Updated: 2022/01/18 14:41:32 by dimioui          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SERVER = server
CLIENT = client
FLAGS = -Wall -Wextra -Werror -g

SRCS_SERV = $(addprefix srcs/, \
			server.c \
			)

OBJS_SERV = $(SRCS_SERV:.c=.o)

SRCS_CLIENT = $(addprefix srcs/, \
				client.c \
				)

OBJS_CLIENT = $(SRCS_CLIENT:.c=.o)

LIB = ./libft/libft.a

all: $(SERVER) $(CLIENT)

LIBFT = /libft/libft.a

$(LIBFT):
	@make -sC libft > /dev/null

%.o:%.c
	@cc $(FLAGS) -c $< -o $@

$(SERVER):$(OBJS_SERV) $(LIBFT)
	@cc $(FLAGS) -o $(SERVER) $(OBJS_SERV) $(LIB)

$(CLIENT):$(OBJS_CLIENT) $(LIBFT)
	@cc $(FLAGS) -o $(CLIENT) $(OBJS_CLIENT) $(LIB)

clean:
	@rm -rf $(OBJS_SERV) $(OBJS_CLIENT)

fclean: clean
	@rm -rf $(SERVER) $(CLIENT)
	@make fclean -sC libft > /dev/null

re: fclean all
