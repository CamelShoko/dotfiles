# exe by vim
import sys
import os
import vim
#sys.path.append(os.environ['HOME'] + '/.vim/python')
#import vithon

def vim_command(fun):
    vim.command("command! -nargs=%s -complete=customlist,%s %s python %s(<f-args>)"%
            ("*", fun.func_name, fun.func_name, fun.func_name))
    return fun

# add header file def statement
@vim_command
def HeaderInit():
    filename_list = os.path.basename(vim.current.buffer.name).split(".")
    if len(filename_list) == 2 and filename_list[-1] == "h":
        str_def = "__%s__"%"_".join([i.upper() for i in filename_list])
        if vim.current.buffer[0] != "#ifndef "+str_def:
            vim.command("normal gg3O")
            vim.current.buffer[0] = "#ifndef "+str_def
            vim.current.buffer[1] = "#define "+str_def
            vim.current.buffer[2] = ""
            vim.current.buffer.append("#endif")
