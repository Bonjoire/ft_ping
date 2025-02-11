# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hubourge <hubourge@student.42angouleme.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/24 14:34:48 by hubourge          #+#    #+#              #
#    Updated: 2025/02/11 21:41:27 by hubourge         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CXX			= gcc

NAME		= ft_ping

CFLAGS		=  -Wall -Wextra -Werror -g

INCLUDE		= -I includes

LIBFT_DIR	= ./libft
LIBFT		= $(LIBFT_DIR)/libft.a

OBJ_DIR		= obj

SRC			= srcs/main.c \
				
OBJ			= $(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))

YELLOW		=\033[0;33m
BIBlue		=\033[1;94m
NC			=\033[0m

all: $(LIBFT) $(OBJ) 
	@ echo "$(YELLOW)Compiling ft_nm...$(NC)"
	@ $(CXX) $(CFLAGS) ${INCLUDE} -o $(NAME) $(OBJ) -L $(LIBFT_DIR) -lft
	@ echo "$(BIBlue)"
	@ echo "   __ _                       "
	@ echo "  / _| |_     _ __  _ __ ___  "
	@ echo " | |_| __|   | '_ \| '_ \` _ \ "
	@ echo " |  _| |_    | | | | | | | | |"
	@ echo " |_|  \__|___|_| |_|_| |_| |_|"
	@ echo "        |_____|               "
	@ echo "                   by hubourge"
	@ echo "$(NC)"

bonus: all

$(LIBFT):
	@ echo "$(YELLOW)Compiling libft...$(NC)"	
	@ make -sC $(LIBFT_DIR)

$(OBJ_DIR)/%.o: %.c
	@ mkdir -p $(@D)
	@ $(CXX) $(CFLAGS) ${INCLUDE} -c $< -o $@

clean:
	@ echo "$(YELLOW)Cleaning in progress...$(NC)"
	@ rm -rf $(OBJ) obj
	@ make -sC $(LIBFT_DIR) clean
	@ echo "$(YELLOW)Cleaning completed$(NC)\n"

fclean: clean
	@ rm -rf $(NAME)
	@ make -sC $(LIBFT_DIR) fclean

re: fclean all

.PHONY: all clean fclean re bonus