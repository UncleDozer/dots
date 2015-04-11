function work
	set tpath $HOME/public_html/$argv
		urxvtc --hold -cd $tpath -e grunt server;
		urxvtc --hold -cd $tpath -e grunt php server;
		echo "Grunt PHP server started at $tpath";
		echo "Grunt Watch started at $tpath";
		urxvtc --hold -cd $tpath -e $EDITOR;
    urxvtc -cd $tpath;
		urxvtc --hold -cd $tpath -e $EDITOR
end
