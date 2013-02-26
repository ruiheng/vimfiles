==============
 What and How
==============

This is a set of files used as my vim configuration. It contains files that probably be useful to other VIM users.

NOTE: Because 'git submodule' is used, if some submodule is added after you cloned the git repository, you need to run:
> git submodule update --init
Otherwise, some directories may be missing.

Settings
============

The following files should be common to all users:

  * rc_entry.vim : entry point
  * local_settings.default.vim : settings that is loaded before plugins loads.
  * fixed/plugin/after_plugins_loaded.vim : settings that is loaed after all plugins have been loaded.

Real personal settings should be in (all are optional):

  * ~/vimfiles/local_settings.vim : loaded right after local_settings.default.vim 
  * ~/vimfiles/final_settings.vim : loaded at final stage, can override everythin.

In other words:

  * If you need to set some personal settings BEFORE plugins have been loaded, do it in ~/vimfiles/local_settings.vim

  * If you need to set some personal settings AFTER plugins have been loaded, do it in ~/vimfiles/final_settings.vim


Plug-ins
============

Vim plug-ins are in `available` dir. one subdir should be used for one plugin.

All plug-ins are disabled by default. To enable a plugin, you just need to create a symbolic link in `bundle` dir to the corresponding subdir in `available`. To disable it again, just remove that symbolic link.

NOTES: On windows vista or later, you can `mklink` command to create symbolic links. But need administrator privileges. See enable-plugin.bat for example.


Example Usage
==============

For example, this is what I need to do on a newly installed system:

  * create symbolic link ~/vimfiles/local_settings.vim ,
    points to <vimfiles_project>/local_settings.ruiheng.vim .

  * create symbolic link ~/_vimrc or .vimrc or (you know what),
    points to <vimfiles_project>/ruiheng.vimrc .

  * create symbolic links in `bundle` dir, to choose plugins I need.
