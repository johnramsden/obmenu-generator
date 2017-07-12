#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    raw:       any valid Openbox XML string               {raw => q(xml string)},
    begin_cat: begin of a category                  {begin_cat => ["name", "icon"]},
    end_cat:   end of a category                      {end_cat => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

    #          COMMAND                 LABEL                ICON
    {item => ['xdg-open .',        'File Manager',      'file-manager']},
    {item => ['terminator',         'Terminal',          'terminal']},
    {item => ['xdg-open http://',  'Web Browser',       'web-browser']},

    {sep => 'Categories'},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['other',       'Other',       'applications-other']},
    {cat => ['settings',    'Settings',    'applications-accessories']},
    {cat => ['system',      'System',      'applications-system']},
    {cat => ['consoleonly', 'CLI Applications',   'applications-utilities']},
    ## Custom advanced settings
    {sep => undef},
    {begin_cat => ['Advanced Settings', 'gnome-settings']},

        # Configuration files
        {item => ["$editor ~/.conkyrc",              'Conky RC',    'text-x-source']},
        {item => ["$editor ~/.config/tint2/tint2rc", 'Tint2 Panel', 'text-x-source']},

        # obmenu-generator category
        {begin_cat => ['Obmenu-Generator', 'menu-editor']},
            {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-source']},
            {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-source']},

            {sep  => undef},
            {item => ['obmenu-generator -p',       'Generate a pipe menu',              'menu-editor']},
            {item => ['obmenu-generator -s -c',    'Generate a static menu',            'menu-editor']},
            {item => ['obmenu-generator -p -i',    'Generate a pipe menu with icons',   'menu-editor']},
            {item => ['obmenu-generator -s -i -c', 'Generate a static menu with icons', 'menu-editor']},
            {sep  => undef},

            {item => ['obmenu-generator -d', 'Refresh Icon Set', 'gtk-refresh']},
        {end_cat => undef},

        # Openbox category
        {begin_cat => ['Openbox', 'openbox']},
            {item => ['openbox --reconfigure',               'Reconfigure Openbox', 'openbox']},
            {item => ["$editor ~/.config/openbox/autostart", 'Openbox Autostart',   'shellscript']},
            {item => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-xml']},
            {item => ["$editor ~/.config/openbox/menu.xml",  'Openbox Menu',        'text-xml']},
        {end_cat => undef},

        {sep  => undef},
    		{begin_cat => ['Default Boot Setting', 'system-run']},
    			{item => ['sudo /home/john/.local/bin/replaceboot Archon',      'Boot Archon',      'system-run']},
    			{item => ['sudo /home/john/.local/bin/replaceboot Hector',  'Boot Hector',      'system-run']},
    			{item => ['sudo /home/john/.local/bin/replaceboot Tiny',    'Boot Tiny',       'system-run']},
    		{end_cat => undef},

    {end_cat => undef},
    {sep => undef},

	# Scripts Category
	{begin_cat => ['Scripts', 'shellscript']},
		#          COMMAND                 LABEL                ICON
		{item => ['/home/john/.local/bin/screenshot', 'Screenshot', 'shellscript']},
	{end_cat => undef},

    # Exit category
    {begin_cat => ['Leave', 'leave']},
        #          COMMAND                 LABEL                ICON
        {item => ['openbox --exit',      'Log out',      'system-run']},
        {item => ['systemctl poweroff',  'Shutdown',      'system-run']},
        {item => ['systemctl reboot',    'Restart',       'system-run']},

        {sep  => undef},
        {begin_cat => ['Boot Other', 'system-run']},
          {item => ['sudo /home/john/.local/bin/replace-and-reboot Hector',  'Boot Hector',      'system-run']},
          {item => ['sudo /home/john/.local/bin/replace-and-reboot Tiny',    'Boot Tiny',       'system-run']},
        {end_cat => undef},
    {end_cat => undef},

]
