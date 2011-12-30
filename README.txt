This is a set of files used as my vim configuration.

These files should common to all users:

  * rc_entry.vim
  * local_settings.default.vim

Real personal settings should be in (all are optional):

  * ~/vimfiles/local_settings.vim : loaded right after local_settings.default.vim 
  * ~/vimfiles/final_settings.vim : loaded at final stage, can override everythin.

For example, this is what I needs to do on a newly installed system:

  * create symbolic link ~/vimfiles/local_settings.vim ,
    points to <vimfiles_project>/local_settings.ruiheng.vim .

  * create symbolic link ~/_vimrc or .vimrc or (you know what),
    points to <vimfiles_project>/ruiheng.vimrc .
