sub pish_chdir(argv)
	if chdir([argv + 8]) < 0 then
		pish_puts([argv + 8])
		pish_puts("?")
		putch(10)
	end
end

sub pish_puts(str)
	local c
	while c = [str] & 255 do
		putch(c)
		str = str + 1
	end
end

sub pish_str_equal(a, b)
	while ([a] & 255) == ([b] & 255) do
		if !([a] & 255) then
			return 1
		end
		a = a + 1
		b = b + 1
	end
	return 0
end

sub pish_path(buf, dir, file)
	local c
	while c = ([dir] & 255) do
		[buf] = c
		buf = buf + 1
		dir = dir + 1
	end
	while c = ([file] & 255) do
		[buf] = c
		buf = buf + 1
		file = file + 1
	end
	[buf] = 0
end

sub pish_exec(buf, argv)
	local pid
	pid = fork()
	if pid == 0 then
		exec([argv], argv)
		pish_path(buf, "./", [argv])
		exec(buf, argv)
		pish_path(buf, "/bin/", [argv])
		exec(buf, argv)
		pish_puts([argv])
		pish_puts("?")
		putch(10)
		exit()
	else
		waitpid(pid)
	end
end

sub pish_parse_line(line, argv)
	local tempLine, tempArgv, c

	tempLine = line
	tempArgv = argv

	c = [tempLine] & 255
	while c != 10 && c do
		while c == 32 do
			[tempLine] = [tempLine] & (-256)
			tempLine = tempLine + 1
			c = [tempLine] & 255
		end
		if c != 10 then
			[tempArgv] = tempLine
			tempArgv = tempArgv + 8
		end
		while (c != 32) && (c != 10) && c do
			tempLine = tempLine + 1
			c = [tempLine] & 255
		end
	end
	[tempArgv] = 0
end

sub main()
	local dirBuf, lineBuf, tempLine, argvBuf, tempBuf, c, recognized

	dirBuf = brk(-1)
	lineBuf = dirBuf + 1024
	argvBuf = lineBuf + 1024
	tempBuf = argvBuf + 1024
	brk(tempBuf + 1024)

	while 1 do
		getcwd(dirBuf, 1024)
		pish_puts(dirBuf)
		putch([">"])
		putch(32)

		c = getch() & 255
		tempLine = lineBuf
		while c && (c != 10) do
			[tempLine] = c
			tempLine = tempLine + 1
			c = getch() & 255
		end
		[tempLine] = 0
		pish_parse_line(lineBuf, argvBuf)
		recognized = 0
		if pish_str_equal([argvBuf], "exit") then exit() recognized = 1 end
		if pish_str_equal([argvBuf], "cd") then pish_chdir(argvBuf) recognized = 1 end
		if !recognized then pish_exec(tempBuf, argvBuf) end
		
	end

end

