# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amiguez <amiguez@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/11 21:11:46 by amiguez           #+#    #+#              #
#    Updated: 2022/03/18 15:08:56 by amiguez          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = push_swap

# ///////////////////////////

LST_SRCS	:= main.c\
			fill.c\
			debug.c\
			isspace_split.c\
			sorting.c\
			rotate.c\
			reverse_rotate.c\
			push.c\
			swap.c
LST_OBJS	:= $(LST_SRCS:.c=.o)
LST_INCS	:= p_swap.h
AR_LIBFT	:= libft.a

# ///////////////////////////

DIR_SRCS	:= srcs
DIR_OBJS	:= .objs
DIR_INCS	:= .
DIR_ARLIB	:= libft

# ///////////////////////////

SRCS		:= $(addprefix $(DIR_SRCS)/,$(LST_SRCS))
OBJS		:= $(addprefix $(DIR_OBJS)/,$(LST_OBJS))
INCS		:= $(addprefix $(DIR_INCS)/,$(LST_INCS))
LIBFT		:= $(addprefix $(DIR_ARLIB)/,$(AR_LIBFT))

# ///////////////////////////

CC		:= gcc
CFLAGS	:= 

# ///////////////////////////

ERASE	=	\033[2K\r
GREY	=	\033[30m
RED		=	\033[31m
GREEN	=	\033[32m
YELLOW	=	\033[33m
BLUE	=	\033[34m
PINK	=	\033[35m
CYAN	=	\033[36m
WHITE	=	\033[37m
BOLD	=	\033[1m
UNDER	=	\033[4m
SUR		=	\033[7m
END		=	\033[0m

NORMITEST = 
NORMINETTE = $(shell norminette $(SRCS) $(INCS) | grep -i 'Error!')

# ///////////////////////////

all : $(NAME)

$(NAME) : $(LIBFT) $(OBJS)
	$(CC) $(CFLAGS) $^ $(LIBFT) -o $(NAME)
	printf "\n$(UNDER)$(BOLD)$(PINK)Push_swap is compiled !\n$(END)"

ifeq ($(NORMINETTE),$(NORMITEST))
	printf "\n$(GREEN)Everything is ok\n$(END)"
else
	printf "\n$(RED)$(SUR)THERE IS AN ERROR WITH NORMINETTE IN PUSH_SWAP FILES!!$(END)\n"
endif

$(DIR_OBJS)/%.o : $(DIR_SRCS)/%.c $(INCS) Makefile | $(DIR_OBJS)
	$(CC) $(CFLAGS) -I $(INCS) -c $< -o $@
	printf "$(ERASE)Compiling .o : $(BLUE) $<$ $(END)"
	

$(DIR_OBJS) :
	mkdir -p .objs

$(LIBFT) :
	make -C libft
# ///////////////////////////

clean :
	rm -rf $(DIR_OBJS)
	make -C libft fclean
	printf "$(CYAN) /!\ $(END)Erasing .o in push_swap$(CYAN) /!\ \n$(END)"

fclean : clean
	rm -rf $(NAME)
	printf "$(RED) /!\ $(END)Erasing push_swap$(RED) /!\ \n$(END)"

re : fclean all

.PHONY : re fclean clean all $(LIBFT) 
.SILENT :