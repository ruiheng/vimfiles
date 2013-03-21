==============
 What and How
==============

This is a set of files used as my vim configuration. It contains files that probably be useful to other VIM users.

NOTE: Because 'git submodule' is used, if some submodule is added after you cloned the git repository, you need to run:
> git submodule update --init
Otherwise, some directories may be missing.

Settings
============

NOTE: <username> is the value of variable 'g:vimfiles_username'.

The following files should be common to all users:

  * rc_entry.vim : entry point
  * local_settings.default.vim : settings that is loaded before any plugin loads.
  * fixed/plugin/after_plugins_loaded.vim : settings that is loaed after all plugins have been loaded.

Real personal settings should be in (all of the following files are optional):

  * local_settings.<username>.vim or ~/vimfiles/local_settings.vim : loaded right after local_settings.default.vim 
  * ~/vimfiles/final_settings.vim : loaded at final stage, can override everythin.

In other words:

  * If you need to set some personal settings BEFORE plugins have been loaded, do it in ~/vimfiles/local_settings.vim

  * If you need to set some personal settings AFTER plugins have been loaded, do it in ~/vimfiles/final_settings.vim


Plug-ins
============

Vim plug-ins are in `available` dir. one subdir should be used for one plugin. They are called bundles in 'pathogen'.

All plug-ins are disabled by default. To enable a plugin, you need to do one of the followings:

 * create a symbolic link in `bundle` dir to the corresponding subdir in `available`.
   To disable it again, just remove that symbolic link.

   NOTES: On windows vista or later, you can `mklink` command to create symbolic links. But need administrator privileges. See enable-plugin.bat for example.

 * create a variable 'g:load_bundles', which contains a list of names of bundles, which will be loaded. This is a little easier to use than symbolic link on Windows.
   See ruiheng.vimrc for example.


Example Usage
==============

For example, this is what I need to do on a newly installed system:

  * create symbolic link ~/_vimrc or .vimrc or (you know what),
    points to <vimfiles_project>/ruiheng.vimrc, in which a global variable
    'g:vimfiles_username' is set to 'ruiheng'.

    File <vimfiles_project>/local_settings.ruiheng.vim will be loaded.

  * create symbolic links in `bundle` dir, to choose plugins/bundles that I need in addition to those in g:load_bundles.

Mapped Keys
============

global
--------
<F6>: save session (to the last file named in :mks)
<F4>: select the last changed (or pasted) text.

fuzzyfinder
-----------
<leader>fb
<leader>ff

YankRing
----------
<F11>

