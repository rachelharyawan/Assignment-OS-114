
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <setbuiltin>:
#ifdef USE_BUILTINS
// ***** processing for shell builtins begins here *****

int
setbuiltin(char *p)
{
       0:	f3 0f 1e fb          	endbr32 
       4:	55                   	push   %ebp
       5:	89 e5                	mov    %esp,%ebp
       7:	53                   	push   %ebx
       8:	83 ec 10             	sub    $0x10,%esp
  int i;
  int rc;

  p += strlen("_set");
       b:	68 58 13 00 00       	push   $0x1358
      10:	e8 c3 0c 00 00       	call   cd8 <strlen>
      15:	03 45 08             	add    0x8(%ebp),%eax
      18:	89 c3                	mov    %eax,%ebx
  while (strncmp(p, " ", 1) == 0) p++; // chomp spaces
      1a:	83 c4 10             	add    $0x10,%esp
      1d:	83 ec 04             	sub    $0x4,%esp
      20:	6a 01                	push   $0x1
      22:	68 9f 13 00 00       	push   $0x139f
      27:	53                   	push   %ebx
      28:	e8 74 0e 00 00       	call   ea1 <strncmp>
      2d:	83 c4 10             	add    $0x10,%esp
      30:	85 c0                	test   %eax,%eax
      32:	75 05                	jne    39 <setbuiltin+0x39>
      34:	83 c3 01             	add    $0x1,%ebx
      37:	eb e4                	jmp    1d <setbuiltin+0x1d>
  if (strncmp("uid", p, 3) == 0) {
      39:	83 ec 04             	sub    $0x4,%esp
      3c:	6a 03                	push   $0x3
      3e:	53                   	push   %ebx
      3f:	68 5d 13 00 00       	push   $0x135d
      44:	e8 58 0e 00 00       	call   ea1 <strncmp>
      49:	83 c4 10             	add    $0x10,%esp
      4c:	85 c0                	test   %eax,%eax
      4e:	75 4b                	jne    9b <setbuiltin+0x9b>
    p += strlen("uid");
      50:	83 ec 0c             	sub    $0xc,%esp
      53:	68 5d 13 00 00       	push   $0x135d
      58:	e8 7b 0c 00 00       	call   cd8 <strlen>
      5d:	01 c3                	add    %eax,%ebx
    while (strncmp(p, " ", 1) == 0) p++; // chomp spaces
      5f:	83 c4 10             	add    $0x10,%esp
      62:	83 ec 04             	sub    $0x4,%esp
      65:	6a 01                	push   $0x1
      67:	68 9f 13 00 00       	push   $0x139f
      6c:	53                   	push   %ebx
      6d:	e8 2f 0e 00 00       	call   ea1 <strncmp>
      72:	83 c4 10             	add    $0x10,%esp
      75:	85 c0                	test   %eax,%eax
      77:	75 05                	jne    7e <setbuiltin+0x7e>
      79:	83 c3 01             	add    $0x1,%ebx
      7c:	eb e4                	jmp    62 <setbuiltin+0x62>
    i = atoi(p);
      7e:	83 ec 0c             	sub    $0xc,%esp
      81:	53                   	push   %ebx
      82:	e8 50 0d 00 00       	call   dd7 <atoi>
    rc = (setuid(i));
      87:	89 04 24             	mov    %eax,(%esp)
      8a:	e8 53 0f 00 00       	call   fe2 <setuid>
    if (rc == 0)
      8f:	83 c4 10             	add    $0x10,%esp
      92:	85 c0                	test   %eax,%eax
      94:	75 62                	jne    f8 <setbuiltin+0xf8>
    if (rc == 0)
      return 0;
  }
  printf(2, "Invalid _set parameter\n");
  return -1;
}
      96:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      99:	c9                   	leave  
      9a:	c3                   	ret    
  if (strncmp("gid", p, 3) == 0) {
      9b:	83 ec 04             	sub    $0x4,%esp
      9e:	6a 03                	push   $0x3
      a0:	53                   	push   %ebx
      a1:	68 61 13 00 00       	push   $0x1361
      a6:	e8 f6 0d 00 00       	call   ea1 <strncmp>
      ab:	83 c4 10             	add    $0x10,%esp
      ae:	85 c0                	test   %eax,%eax
      b0:	75 46                	jne    f8 <setbuiltin+0xf8>
    p += strlen("gid");
      b2:	83 ec 0c             	sub    $0xc,%esp
      b5:	68 61 13 00 00       	push   $0x1361
      ba:	e8 19 0c 00 00       	call   cd8 <strlen>
      bf:	01 c3                	add    %eax,%ebx
    while (strncmp(p, " ", 1) == 0) p++; // chomp spaces
      c1:	83 c4 10             	add    $0x10,%esp
      c4:	83 ec 04             	sub    $0x4,%esp
      c7:	6a 01                	push   $0x1
      c9:	68 9f 13 00 00       	push   $0x139f
      ce:	53                   	push   %ebx
      cf:	e8 cd 0d 00 00       	call   ea1 <strncmp>
      d4:	83 c4 10             	add    $0x10,%esp
      d7:	85 c0                	test   %eax,%eax
      d9:	75 05                	jne    e0 <setbuiltin+0xe0>
      db:	83 c3 01             	add    $0x1,%ebx
      de:	eb e4                	jmp    c4 <setbuiltin+0xc4>
    i = atoi(p);
      e0:	83 ec 0c             	sub    $0xc,%esp
      e3:	53                   	push   %ebx
      e4:	e8 ee 0c 00 00       	call   dd7 <atoi>
    rc = (setgid(i));
      e9:	89 04 24             	mov    %eax,(%esp)
      ec:	e8 f9 0e 00 00       	call   fea <setgid>
    if (rc == 0)
      f1:	83 c4 10             	add    $0x10,%esp
      f4:	85 c0                	test   %eax,%eax
      f6:	74 9e                	je     96 <setbuiltin+0x96>
  printf(2, "Invalid _set parameter\n");
      f8:	83 ec 08             	sub    $0x8,%esp
      fb:	68 65 13 00 00       	push   $0x1365
     100:	6a 02                	push   $0x2
     102:	e8 94 0f 00 00       	call   109b <printf>
  return -1;
     107:	83 c4 10             	add    $0x10,%esp
     10a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     10f:	eb 85                	jmp    96 <setbuiltin+0x96>

00000111 <getbuiltin>:

int
getbuiltin(char *p)
{
     111:	f3 0f 1e fb          	endbr32 
     115:	55                   	push   %ebp
     116:	89 e5                	mov    %esp,%ebp
     118:	56                   	push   %esi
     119:	53                   	push   %ebx
  p += strlen("_get");
     11a:	83 ec 0c             	sub    $0xc,%esp
     11d:	68 7d 13 00 00       	push   $0x137d
     122:	e8 b1 0b 00 00       	call   cd8 <strlen>
     127:	03 45 08             	add    0x8(%ebp),%eax
     12a:	89 c3                	mov    %eax,%ebx
  while (strncmp(p, " ", 1) == 0) p++; // chomp spaces
     12c:	83 c4 10             	add    $0x10,%esp
     12f:	83 ec 04             	sub    $0x4,%esp
     132:	6a 01                	push   $0x1
     134:	68 9f 13 00 00       	push   $0x139f
     139:	53                   	push   %ebx
     13a:	e8 62 0d 00 00       	call   ea1 <strncmp>
     13f:	83 c4 10             	add    $0x10,%esp
     142:	85 c0                	test   %eax,%eax
     144:	75 05                	jne    14b <getbuiltin+0x3a>
     146:	83 c3 01             	add    $0x1,%ebx
     149:	eb e4                	jmp    12f <getbuiltin+0x1e>
  if (strncmp("uid", p, 3) == 0) {
     14b:	83 ec 04             	sub    $0x4,%esp
     14e:	6a 03                	push   $0x3
     150:	53                   	push   %ebx
     151:	68 5d 13 00 00       	push   $0x135d
     156:	e8 46 0d 00 00       	call   ea1 <strncmp>
     15b:	89 c6                	mov    %eax,%esi
     15d:	83 c4 10             	add    $0x10,%esp
     160:	85 c0                	test   %eax,%eax
     162:	74 3a                	je     19e <getbuiltin+0x8d>
    printf(2, "%d\n", getuid());
    return 0;
  }
  if (strncmp("gid", p, 3) == 0) {
     164:	83 ec 04             	sub    $0x4,%esp
     167:	6a 03                	push   $0x3
     169:	53                   	push   %ebx
     16a:	68 61 13 00 00       	push   $0x1361
     16f:	e8 2d 0d 00 00       	call   ea1 <strncmp>
     174:	89 c6                	mov    %eax,%esi
     176:	83 c4 10             	add    $0x10,%esp
     179:	85 c0                	test   %eax,%eax
     17b:	75 3b                	jne    1b8 <getbuiltin+0xa7>
    printf(2, "%d\n", getgid());
     17d:	e8 50 0e 00 00       	call   fd2 <getgid>
     182:	83 ec 04             	sub    $0x4,%esp
     185:	50                   	push   %eax
     186:	68 82 13 00 00       	push   $0x1382
     18b:	6a 02                	push   $0x2
     18d:	e8 09 0f 00 00       	call   109b <printf>
    return 0;
     192:	83 c4 10             	add    $0x10,%esp
  }
  printf(2, "Invalid _get parameter\n");
  return -1;
}
     195:	89 f0                	mov    %esi,%eax
     197:	8d 65 f8             	lea    -0x8(%ebp),%esp
     19a:	5b                   	pop    %ebx
     19b:	5e                   	pop    %esi
     19c:	5d                   	pop    %ebp
     19d:	c3                   	ret    
    printf(2, "%d\n", getuid());
     19e:	e8 27 0e 00 00       	call   fca <getuid>
     1a3:	83 ec 04             	sub    $0x4,%esp
     1a6:	50                   	push   %eax
     1a7:	68 82 13 00 00       	push   $0x1382
     1ac:	6a 02                	push   $0x2
     1ae:	e8 e8 0e 00 00       	call   109b <printf>
    return 0;
     1b3:	83 c4 10             	add    $0x10,%esp
     1b6:	eb dd                	jmp    195 <getbuiltin+0x84>
  printf(2, "Invalid _get parameter\n");
     1b8:	83 ec 08             	sub    $0x8,%esp
     1bb:	68 86 13 00 00       	push   $0x1386
     1c0:	6a 02                	push   $0x2
     1c2:	e8 d4 0e 00 00       	call   109b <printf>
  return -1;
     1c7:	83 c4 10             	add    $0x10,%esp
     1ca:	be ff ff ff ff       	mov    $0xffffffff,%esi
     1cf:	eb c4                	jmp    195 <getbuiltin+0x84>

000001d1 <getcmd>:
{
     1d1:	f3 0f 1e fb          	endbr32 
     1d5:	55                   	push   %ebp
     1d6:	89 e5                	mov    %esp,%ebp
     1d8:	56                   	push   %esi
     1d9:	53                   	push   %ebx
     1da:	8b 5d 08             	mov    0x8(%ebp),%ebx
     1dd:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     1e0:	83 ec 08             	sub    $0x8,%esp
     1e3:	68 9e 13 00 00       	push   $0x139e
     1e8:	6a 02                	push   $0x2
     1ea:	e8 ac 0e 00 00       	call   109b <printf>
  memset(buf, 0, nbuf);
     1ef:	83 c4 0c             	add    $0xc,%esp
     1f2:	56                   	push   %esi
     1f3:	6a 00                	push   $0x0
     1f5:	53                   	push   %ebx
     1f6:	e8 f9 0a 00 00       	call   cf4 <memset>
  gets(buf, nbuf);
     1fb:	83 c4 08             	add    $0x8,%esp
     1fe:	56                   	push   %esi
     1ff:	53                   	push   %ebx
     200:	e8 2f 0b 00 00       	call   d34 <gets>
  if(buf[0] == 0) // EOF
     205:	83 c4 10             	add    $0x10,%esp
     208:	80 3b 00             	cmpb   $0x0,(%ebx)
     20b:	74 0c                	je     219 <getcmd+0x48>
  return 0;
     20d:	b8 00 00 00 00       	mov    $0x0,%eax
}
     212:	8d 65 f8             	lea    -0x8(%ebp),%esp
     215:	5b                   	pop    %ebx
     216:	5e                   	pop    %esi
     217:	5d                   	pop    %ebp
     218:	c3                   	ret    
    return -1;
     219:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     21e:	eb f2                	jmp    212 <getcmd+0x41>

00000220 <dobuiltin>:
  {"_get", getbuiltin}
};
int FDTcount = sizeof(fdt) / sizeof(fdt[0]); // # entris in FDT

void
dobuiltin(char *cmd) {
     220:	f3 0f 1e fb          	endbr32 
     224:	55                   	push   %ebp
     225:	89 e5                	mov    %esp,%ebp
     227:	56                   	push   %esi
     228:	53                   	push   %ebx
     229:	8b 75 08             	mov    0x8(%ebp),%esi
  int i;

  for (i=0; i<FDTcount; i++)
     22c:	bb 00 00 00 00       	mov    $0x0,%ebx
     231:	eb 03                	jmp    236 <dobuiltin+0x16>
     233:	83 c3 01             	add    $0x1,%ebx
     236:	39 1d f4 1a 00 00    	cmp    %ebx,0x1af4
     23c:	7e 37                	jle    275 <dobuiltin+0x55>
    if (strncmp(cmd, fdt[i].cmd, strlen(fdt[i].cmd)) == 0)
     23e:	83 ec 0c             	sub    $0xc,%esp
     241:	ff 34 dd f8 1a 00 00 	pushl  0x1af8(,%ebx,8)
     248:	e8 8b 0a 00 00       	call   cd8 <strlen>
     24d:	83 c4 0c             	add    $0xc,%esp
     250:	50                   	push   %eax
     251:	ff 34 dd f8 1a 00 00 	pushl  0x1af8(,%ebx,8)
     258:	56                   	push   %esi
     259:	e8 43 0c 00 00       	call   ea1 <strncmp>
     25e:	83 c4 10             	add    $0x10,%esp
     261:	85 c0                	test   %eax,%eax
     263:	75 ce                	jne    233 <dobuiltin+0x13>
     (*fdt[i].name)(cmd);
     265:	83 ec 0c             	sub    $0xc,%esp
     268:	56                   	push   %esi
     269:	ff 14 dd fc 1a 00 00 	call   *0x1afc(,%ebx,8)
     270:	83 c4 10             	add    $0x10,%esp
     273:	eb be                	jmp    233 <dobuiltin+0x13>
}
     275:	8d 65 f8             	lea    -0x8(%ebp),%esp
     278:	5b                   	pop    %ebx
     279:	5e                   	pop    %esi
     27a:	5d                   	pop    %ebp
     27b:	c3                   	ret    

0000027c <panic>:
  exit();
}

void
panic(char *s)
{
     27c:	f3 0f 1e fb          	endbr32 
     280:	55                   	push   %ebp
     281:	89 e5                	mov    %esp,%ebp
     283:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     286:	ff 75 08             	pushl  0x8(%ebp)
     289:	68 3b 14 00 00       	push   $0x143b
     28e:	6a 02                	push   $0x2
     290:	e8 06 0e 00 00       	call   109b <printf>
  exit();
     295:	e8 80 0c 00 00       	call   f1a <exit>

0000029a <fork1>:
}

int
fork1(void)
{
     29a:	f3 0f 1e fb          	endbr32 
     29e:	55                   	push   %ebp
     29f:	89 e5                	mov    %esp,%ebp
     2a1:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
     2a4:	e8 69 0c 00 00       	call   f12 <fork>
  if(pid == -1)
     2a9:	83 f8 ff             	cmp    $0xffffffff,%eax
     2ac:	74 02                	je     2b0 <fork1+0x16>
    panic("fork");
  return pid;
}
     2ae:	c9                   	leave  
     2af:	c3                   	ret    
    panic("fork");
     2b0:	83 ec 0c             	sub    $0xc,%esp
     2b3:	68 a1 13 00 00       	push   $0x13a1
     2b8:	e8 bf ff ff ff       	call   27c <panic>

000002bd <runcmd>:
{
     2bd:	f3 0f 1e fb          	endbr32 
     2c1:	55                   	push   %ebp
     2c2:	89 e5                	mov    %esp,%ebp
     2c4:	53                   	push   %ebx
     2c5:	83 ec 14             	sub    $0x14,%esp
     2c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     2cb:	85 db                	test   %ebx,%ebx
     2cd:	74 0f                	je     2de <runcmd+0x21>
  switch(cmd->type){
     2cf:	8b 03                	mov    (%ebx),%eax
     2d1:	83 f8 05             	cmp    $0x5,%eax
     2d4:	77 0d                	ja     2e3 <runcmd+0x26>
     2d6:	3e ff 24 85 5c 14 00 	notrack jmp *0x145c(,%eax,4)
     2dd:	00 
    exit();
     2de:	e8 37 0c 00 00       	call   f1a <exit>
    panic("runcmd");
     2e3:	83 ec 0c             	sub    $0xc,%esp
     2e6:	68 a6 13 00 00       	push   $0x13a6
     2eb:	e8 8c ff ff ff       	call   27c <panic>
    if(ecmd->argv[0] == 0)
     2f0:	8b 43 04             	mov    0x4(%ebx),%eax
     2f3:	85 c0                	test   %eax,%eax
     2f5:	74 27                	je     31e <runcmd+0x61>
    exec(ecmd->argv[0], ecmd->argv);
     2f7:	8d 53 04             	lea    0x4(%ebx),%edx
     2fa:	83 ec 08             	sub    $0x8,%esp
     2fd:	52                   	push   %edx
     2fe:	50                   	push   %eax
     2ff:	e8 4e 0c 00 00       	call   f52 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     304:	83 c4 0c             	add    $0xc,%esp
     307:	ff 73 04             	pushl  0x4(%ebx)
     30a:	68 ad 13 00 00       	push   $0x13ad
     30f:	6a 02                	push   $0x2
     311:	e8 85 0d 00 00       	call   109b <printf>
    break;
     316:	83 c4 10             	add    $0x10,%esp
  exit();
     319:	e8 fc 0b 00 00       	call   f1a <exit>
      exit();
     31e:	e8 f7 0b 00 00       	call   f1a <exit>
    close(rcmd->fd);
     323:	83 ec 0c             	sub    $0xc,%esp
     326:	ff 73 14             	pushl  0x14(%ebx)
     329:	e8 14 0c 00 00       	call   f42 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     32e:	83 c4 08             	add    $0x8,%esp
     331:	ff 73 10             	pushl  0x10(%ebx)
     334:	ff 73 08             	pushl  0x8(%ebx)
     337:	e8 1e 0c 00 00       	call   f5a <open>
     33c:	83 c4 10             	add    $0x10,%esp
     33f:	85 c0                	test   %eax,%eax
     341:	78 0b                	js     34e <runcmd+0x91>
    runcmd(rcmd->cmd);
     343:	83 ec 0c             	sub    $0xc,%esp
     346:	ff 73 04             	pushl  0x4(%ebx)
     349:	e8 6f ff ff ff       	call   2bd <runcmd>
      printf(2, "open %s failed\n", rcmd->file);
     34e:	83 ec 04             	sub    $0x4,%esp
     351:	ff 73 08             	pushl  0x8(%ebx)
     354:	68 bd 13 00 00       	push   $0x13bd
     359:	6a 02                	push   $0x2
     35b:	e8 3b 0d 00 00       	call   109b <printf>
      exit();
     360:	e8 b5 0b 00 00       	call   f1a <exit>
    if(fork1() == 0)
     365:	e8 30 ff ff ff       	call   29a <fork1>
     36a:	85 c0                	test   %eax,%eax
     36c:	74 10                	je     37e <runcmd+0xc1>
    wait();
     36e:	e8 af 0b 00 00       	call   f22 <wait>
    runcmd(lcmd->right);
     373:	83 ec 0c             	sub    $0xc,%esp
     376:	ff 73 08             	pushl  0x8(%ebx)
     379:	e8 3f ff ff ff       	call   2bd <runcmd>
      runcmd(lcmd->left);
     37e:	83 ec 0c             	sub    $0xc,%esp
     381:	ff 73 04             	pushl  0x4(%ebx)
     384:	e8 34 ff ff ff       	call   2bd <runcmd>
    if(pipe(p) < 0)
     389:	83 ec 0c             	sub    $0xc,%esp
     38c:	8d 45 f0             	lea    -0x10(%ebp),%eax
     38f:	50                   	push   %eax
     390:	e8 95 0b 00 00       	call   f2a <pipe>
     395:	83 c4 10             	add    $0x10,%esp
     398:	85 c0                	test   %eax,%eax
     39a:	78 3a                	js     3d6 <runcmd+0x119>
    if(fork1() == 0){
     39c:	e8 f9 fe ff ff       	call   29a <fork1>
     3a1:	85 c0                	test   %eax,%eax
     3a3:	74 3e                	je     3e3 <runcmd+0x126>
    if(fork1() == 0){
     3a5:	e8 f0 fe ff ff       	call   29a <fork1>
     3aa:	85 c0                	test   %eax,%eax
     3ac:	74 6b                	je     419 <runcmd+0x15c>
    close(p[0]);
     3ae:	83 ec 0c             	sub    $0xc,%esp
     3b1:	ff 75 f0             	pushl  -0x10(%ebp)
     3b4:	e8 89 0b 00 00       	call   f42 <close>
    close(p[1]);
     3b9:	83 c4 04             	add    $0x4,%esp
     3bc:	ff 75 f4             	pushl  -0xc(%ebp)
     3bf:	e8 7e 0b 00 00       	call   f42 <close>
    wait();
     3c4:	e8 59 0b 00 00       	call   f22 <wait>
    wait();
     3c9:	e8 54 0b 00 00       	call   f22 <wait>
    break;
     3ce:	83 c4 10             	add    $0x10,%esp
     3d1:	e9 43 ff ff ff       	jmp    319 <runcmd+0x5c>
      panic("pipe");
     3d6:	83 ec 0c             	sub    $0xc,%esp
     3d9:	68 cd 13 00 00       	push   $0x13cd
     3de:	e8 99 fe ff ff       	call   27c <panic>
      close(1);
     3e3:	83 ec 0c             	sub    $0xc,%esp
     3e6:	6a 01                	push   $0x1
     3e8:	e8 55 0b 00 00       	call   f42 <close>
      dup(p[1]);
     3ed:	83 c4 04             	add    $0x4,%esp
     3f0:	ff 75 f4             	pushl  -0xc(%ebp)
     3f3:	e8 9a 0b 00 00       	call   f92 <dup>
      close(p[0]);
     3f8:	83 c4 04             	add    $0x4,%esp
     3fb:	ff 75 f0             	pushl  -0x10(%ebp)
     3fe:	e8 3f 0b 00 00       	call   f42 <close>
      close(p[1]);
     403:	83 c4 04             	add    $0x4,%esp
     406:	ff 75 f4             	pushl  -0xc(%ebp)
     409:	e8 34 0b 00 00       	call   f42 <close>
      runcmd(pcmd->left);
     40e:	83 c4 04             	add    $0x4,%esp
     411:	ff 73 04             	pushl  0x4(%ebx)
     414:	e8 a4 fe ff ff       	call   2bd <runcmd>
      close(0);
     419:	83 ec 0c             	sub    $0xc,%esp
     41c:	6a 00                	push   $0x0
     41e:	e8 1f 0b 00 00       	call   f42 <close>
      dup(p[0]);
     423:	83 c4 04             	add    $0x4,%esp
     426:	ff 75 f0             	pushl  -0x10(%ebp)
     429:	e8 64 0b 00 00       	call   f92 <dup>
      close(p[0]);
     42e:	83 c4 04             	add    $0x4,%esp
     431:	ff 75 f0             	pushl  -0x10(%ebp)
     434:	e8 09 0b 00 00       	call   f42 <close>
      close(p[1]);
     439:	83 c4 04             	add    $0x4,%esp
     43c:	ff 75 f4             	pushl  -0xc(%ebp)
     43f:	e8 fe 0a 00 00       	call   f42 <close>
      runcmd(pcmd->right);
     444:	83 c4 04             	add    $0x4,%esp
     447:	ff 73 08             	pushl  0x8(%ebx)
     44a:	e8 6e fe ff ff       	call   2bd <runcmd>
    if(fork1() == 0)
     44f:	e8 46 fe ff ff       	call   29a <fork1>
     454:	85 c0                	test   %eax,%eax
     456:	0f 85 bd fe ff ff    	jne    319 <runcmd+0x5c>
      runcmd(bcmd->cmd);
     45c:	83 ec 0c             	sub    $0xc,%esp
     45f:	ff 73 04             	pushl  0x4(%ebx)
     462:	e8 56 fe ff ff       	call   2bd <runcmd>

00000467 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     467:	f3 0f 1e fb          	endbr32 
     46b:	55                   	push   %ebp
     46c:	89 e5                	mov    %esp,%ebp
     46e:	53                   	push   %ebx
     46f:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     472:	6a 54                	push   $0x54
     474:	e8 53 0e 00 00       	call   12cc <malloc>
     479:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     47b:	83 c4 0c             	add    $0xc,%esp
     47e:	6a 54                	push   $0x54
     480:	6a 00                	push   $0x0
     482:	50                   	push   %eax
     483:	e8 6c 08 00 00       	call   cf4 <memset>
  cmd->type = EXEC;
     488:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     48e:	89 d8                	mov    %ebx,%eax
     490:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     493:	c9                   	leave  
     494:	c3                   	ret    

00000495 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     495:	f3 0f 1e fb          	endbr32 
     499:	55                   	push   %ebp
     49a:	89 e5                	mov    %esp,%ebp
     49c:	53                   	push   %ebx
     49d:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4a0:	6a 18                	push   $0x18
     4a2:	e8 25 0e 00 00       	call   12cc <malloc>
     4a7:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4a9:	83 c4 0c             	add    $0xc,%esp
     4ac:	6a 18                	push   $0x18
     4ae:	6a 00                	push   $0x0
     4b0:	50                   	push   %eax
     4b1:	e8 3e 08 00 00       	call   cf4 <memset>
  cmd->type = REDIR;
     4b6:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     4bc:	8b 45 08             	mov    0x8(%ebp),%eax
     4bf:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     4c2:	8b 45 0c             	mov    0xc(%ebp),%eax
     4c5:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     4c8:	8b 45 10             	mov    0x10(%ebp),%eax
     4cb:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     4ce:	8b 45 14             	mov    0x14(%ebp),%eax
     4d1:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     4d4:	8b 45 18             	mov    0x18(%ebp),%eax
     4d7:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     4da:	89 d8                	mov    %ebx,%eax
     4dc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4df:	c9                   	leave  
     4e0:	c3                   	ret    

000004e1 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     4e1:	f3 0f 1e fb          	endbr32 
     4e5:	55                   	push   %ebp
     4e6:	89 e5                	mov    %esp,%ebp
     4e8:	53                   	push   %ebx
     4e9:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4ec:	6a 0c                	push   $0xc
     4ee:	e8 d9 0d 00 00       	call   12cc <malloc>
     4f3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4f5:	83 c4 0c             	add    $0xc,%esp
     4f8:	6a 0c                	push   $0xc
     4fa:	6a 00                	push   $0x0
     4fc:	50                   	push   %eax
     4fd:	e8 f2 07 00 00       	call   cf4 <memset>
  cmd->type = PIPE;
     502:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     508:	8b 45 08             	mov    0x8(%ebp),%eax
     50b:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     50e:	8b 45 0c             	mov    0xc(%ebp),%eax
     511:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     514:	89 d8                	mov    %ebx,%eax
     516:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     519:	c9                   	leave  
     51a:	c3                   	ret    

0000051b <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     51b:	f3 0f 1e fb          	endbr32 
     51f:	55                   	push   %ebp
     520:	89 e5                	mov    %esp,%ebp
     522:	53                   	push   %ebx
     523:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     526:	6a 0c                	push   $0xc
     528:	e8 9f 0d 00 00       	call   12cc <malloc>
     52d:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     52f:	83 c4 0c             	add    $0xc,%esp
     532:	6a 0c                	push   $0xc
     534:	6a 00                	push   $0x0
     536:	50                   	push   %eax
     537:	e8 b8 07 00 00       	call   cf4 <memset>
  cmd->type = LIST;
     53c:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     542:	8b 45 08             	mov    0x8(%ebp),%eax
     545:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     548:	8b 45 0c             	mov    0xc(%ebp),%eax
     54b:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     54e:	89 d8                	mov    %ebx,%eax
     550:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     553:	c9                   	leave  
     554:	c3                   	ret    

00000555 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     555:	f3 0f 1e fb          	endbr32 
     559:	55                   	push   %ebp
     55a:	89 e5                	mov    %esp,%ebp
     55c:	53                   	push   %ebx
     55d:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     560:	6a 08                	push   $0x8
     562:	e8 65 0d 00 00       	call   12cc <malloc>
     567:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     569:	83 c4 0c             	add    $0xc,%esp
     56c:	6a 08                	push   $0x8
     56e:	6a 00                	push   $0x0
     570:	50                   	push   %eax
     571:	e8 7e 07 00 00       	call   cf4 <memset>
  cmd->type = BACK;
     576:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     57c:	8b 45 08             	mov    0x8(%ebp),%eax
     57f:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     582:	89 d8                	mov    %ebx,%eax
     584:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     587:	c9                   	leave  
     588:	c3                   	ret    

00000589 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     589:	f3 0f 1e fb          	endbr32 
     58d:	55                   	push   %ebp
     58e:	89 e5                	mov    %esp,%ebp
     590:	57                   	push   %edi
     591:	56                   	push   %esi
     592:	53                   	push   %ebx
     593:	83 ec 0c             	sub    $0xc,%esp
     596:	8b 75 0c             	mov    0xc(%ebp),%esi
     599:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *s;
  int ret;

  s = *ps;
     59c:	8b 45 08             	mov    0x8(%ebp),%eax
     59f:	8b 18                	mov    (%eax),%ebx
  while(s < es && strchr(whitespace, *s))
     5a1:	39 f3                	cmp    %esi,%ebx
     5a3:	73 1d                	jae    5c2 <gettoken+0x39>
     5a5:	83 ec 08             	sub    $0x8,%esp
     5a8:	0f be 03             	movsbl (%ebx),%eax
     5ab:	50                   	push   %eax
     5ac:	68 ec 1a 00 00       	push   $0x1aec
     5b1:	e8 59 07 00 00       	call   d0f <strchr>
     5b6:	83 c4 10             	add    $0x10,%esp
     5b9:	85 c0                	test   %eax,%eax
     5bb:	74 05                	je     5c2 <gettoken+0x39>
    s++;
     5bd:	83 c3 01             	add    $0x1,%ebx
     5c0:	eb df                	jmp    5a1 <gettoken+0x18>
  if(q)
     5c2:	85 ff                	test   %edi,%edi
     5c4:	74 02                	je     5c8 <gettoken+0x3f>
    *q = s;
     5c6:	89 1f                	mov    %ebx,(%edi)
  ret = *s;
     5c8:	0f b6 03             	movzbl (%ebx),%eax
     5cb:	0f be f8             	movsbl %al,%edi
  switch(*s){
     5ce:	3c 3c                	cmp    $0x3c,%al
     5d0:	7f 27                	jg     5f9 <gettoken+0x70>
     5d2:	3c 3b                	cmp    $0x3b,%al
     5d4:	7d 13                	jge    5e9 <gettoken+0x60>
     5d6:	84 c0                	test   %al,%al
     5d8:	74 12                	je     5ec <gettoken+0x63>
     5da:	78 41                	js     61d <gettoken+0x94>
     5dc:	3c 26                	cmp    $0x26,%al
     5de:	74 09                	je     5e9 <gettoken+0x60>
     5e0:	7c 3b                	jl     61d <gettoken+0x94>
     5e2:	83 e8 28             	sub    $0x28,%eax
     5e5:	3c 01                	cmp    $0x1,%al
     5e7:	77 34                	ja     61d <gettoken+0x94>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     5e9:	83 c3 01             	add    $0x1,%ebx
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     5ec:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     5f0:	74 77                	je     669 <gettoken+0xe0>
    *eq = s;
     5f2:	8b 45 14             	mov    0x14(%ebp),%eax
     5f5:	89 18                	mov    %ebx,(%eax)
     5f7:	eb 70                	jmp    669 <gettoken+0xe0>
  switch(*s){
     5f9:	3c 3e                	cmp    $0x3e,%al
     5fb:	75 0d                	jne    60a <gettoken+0x81>
    s++;
     5fd:	8d 43 01             	lea    0x1(%ebx),%eax
    if(*s == '>'){
     600:	80 7b 01 3e          	cmpb   $0x3e,0x1(%ebx)
     604:	74 0a                	je     610 <gettoken+0x87>
    s++;
     606:	89 c3                	mov    %eax,%ebx
     608:	eb e2                	jmp    5ec <gettoken+0x63>
  switch(*s){
     60a:	3c 7c                	cmp    $0x7c,%al
     60c:	75 0f                	jne    61d <gettoken+0x94>
     60e:	eb d9                	jmp    5e9 <gettoken+0x60>
      s++;
     610:	83 c3 02             	add    $0x2,%ebx
      ret = '+';
     613:	bf 2b 00 00 00       	mov    $0x2b,%edi
     618:	eb d2                	jmp    5ec <gettoken+0x63>
      s++;
     61a:	83 c3 01             	add    $0x1,%ebx
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     61d:	39 f3                	cmp    %esi,%ebx
     61f:	73 37                	jae    658 <gettoken+0xcf>
     621:	83 ec 08             	sub    $0x8,%esp
     624:	0f be 03             	movsbl (%ebx),%eax
     627:	50                   	push   %eax
     628:	68 ec 1a 00 00       	push   $0x1aec
     62d:	e8 dd 06 00 00       	call   d0f <strchr>
     632:	83 c4 10             	add    $0x10,%esp
     635:	85 c0                	test   %eax,%eax
     637:	75 26                	jne    65f <gettoken+0xd6>
     639:	83 ec 08             	sub    $0x8,%esp
     63c:	0f be 03             	movsbl (%ebx),%eax
     63f:	50                   	push   %eax
     640:	68 e4 1a 00 00       	push   $0x1ae4
     645:	e8 c5 06 00 00       	call   d0f <strchr>
     64a:	83 c4 10             	add    $0x10,%esp
     64d:	85 c0                	test   %eax,%eax
     64f:	74 c9                	je     61a <gettoken+0x91>
    ret = 'a';
     651:	bf 61 00 00 00       	mov    $0x61,%edi
     656:	eb 94                	jmp    5ec <gettoken+0x63>
     658:	bf 61 00 00 00       	mov    $0x61,%edi
     65d:	eb 8d                	jmp    5ec <gettoken+0x63>
     65f:	bf 61 00 00 00       	mov    $0x61,%edi
     664:	eb 86                	jmp    5ec <gettoken+0x63>

  while(s < es && strchr(whitespace, *s))
    s++;
     666:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     669:	39 f3                	cmp    %esi,%ebx
     66b:	73 18                	jae    685 <gettoken+0xfc>
     66d:	83 ec 08             	sub    $0x8,%esp
     670:	0f be 03             	movsbl (%ebx),%eax
     673:	50                   	push   %eax
     674:	68 ec 1a 00 00       	push   $0x1aec
     679:	e8 91 06 00 00       	call   d0f <strchr>
     67e:	83 c4 10             	add    $0x10,%esp
     681:	85 c0                	test   %eax,%eax
     683:	75 e1                	jne    666 <gettoken+0xdd>
  *ps = s;
     685:	8b 45 08             	mov    0x8(%ebp),%eax
     688:	89 18                	mov    %ebx,(%eax)
  return ret;
}
     68a:	89 f8                	mov    %edi,%eax
     68c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     68f:	5b                   	pop    %ebx
     690:	5e                   	pop    %esi
     691:	5f                   	pop    %edi
     692:	5d                   	pop    %ebp
     693:	c3                   	ret    

00000694 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     694:	f3 0f 1e fb          	endbr32 
     698:	55                   	push   %ebp
     699:	89 e5                	mov    %esp,%ebp
     69b:	57                   	push   %edi
     69c:	56                   	push   %esi
     69d:	53                   	push   %ebx
     69e:	83 ec 0c             	sub    $0xc,%esp
     6a1:	8b 7d 08             	mov    0x8(%ebp),%edi
     6a4:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     6a7:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     6a9:	39 f3                	cmp    %esi,%ebx
     6ab:	73 1d                	jae    6ca <peek+0x36>
     6ad:	83 ec 08             	sub    $0x8,%esp
     6b0:	0f be 03             	movsbl (%ebx),%eax
     6b3:	50                   	push   %eax
     6b4:	68 ec 1a 00 00       	push   $0x1aec
     6b9:	e8 51 06 00 00       	call   d0f <strchr>
     6be:	83 c4 10             	add    $0x10,%esp
     6c1:	85 c0                	test   %eax,%eax
     6c3:	74 05                	je     6ca <peek+0x36>
    s++;
     6c5:	83 c3 01             	add    $0x1,%ebx
     6c8:	eb df                	jmp    6a9 <peek+0x15>
  *ps = s;
     6ca:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     6cc:	0f b6 03             	movzbl (%ebx),%eax
     6cf:	84 c0                	test   %al,%al
     6d1:	75 0d                	jne    6e0 <peek+0x4c>
     6d3:	b8 00 00 00 00       	mov    $0x0,%eax
}
     6d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6db:	5b                   	pop    %ebx
     6dc:	5e                   	pop    %esi
     6dd:	5f                   	pop    %edi
     6de:	5d                   	pop    %ebp
     6df:	c3                   	ret    
  return *s && strchr(toks, *s);
     6e0:	83 ec 08             	sub    $0x8,%esp
     6e3:	0f be c0             	movsbl %al,%eax
     6e6:	50                   	push   %eax
     6e7:	ff 75 10             	pushl  0x10(%ebp)
     6ea:	e8 20 06 00 00       	call   d0f <strchr>
     6ef:	83 c4 10             	add    $0x10,%esp
     6f2:	85 c0                	test   %eax,%eax
     6f4:	74 07                	je     6fd <peek+0x69>
     6f6:	b8 01 00 00 00       	mov    $0x1,%eax
     6fb:	eb db                	jmp    6d8 <peek+0x44>
     6fd:	b8 00 00 00 00       	mov    $0x0,%eax
     702:	eb d4                	jmp    6d8 <peek+0x44>

00000704 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     704:	f3 0f 1e fb          	endbr32 
     708:	55                   	push   %ebp
     709:	89 e5                	mov    %esp,%ebp
     70b:	57                   	push   %edi
     70c:	56                   	push   %esi
     70d:	53                   	push   %ebx
     70e:	83 ec 1c             	sub    $0x1c,%esp
     711:	8b 7d 0c             	mov    0xc(%ebp),%edi
     714:	8b 75 10             	mov    0x10(%ebp),%esi
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     717:	eb 28                	jmp    741 <parseredirs+0x3d>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     719:	83 ec 0c             	sub    $0xc,%esp
     71c:	68 d2 13 00 00       	push   $0x13d2
     721:	e8 56 fb ff ff       	call   27c <panic>
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     726:	83 ec 0c             	sub    $0xc,%esp
     729:	6a 00                	push   $0x0
     72b:	6a 00                	push   $0x0
     72d:	ff 75 e0             	pushl  -0x20(%ebp)
     730:	ff 75 e4             	pushl  -0x1c(%ebp)
     733:	ff 75 08             	pushl  0x8(%ebp)
     736:	e8 5a fd ff ff       	call   495 <redircmd>
     73b:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     73e:	83 c4 20             	add    $0x20,%esp
  while(peek(ps, es, "<>")){
     741:	83 ec 04             	sub    $0x4,%esp
     744:	68 ef 13 00 00       	push   $0x13ef
     749:	56                   	push   %esi
     74a:	57                   	push   %edi
     74b:	e8 44 ff ff ff       	call   694 <peek>
     750:	83 c4 10             	add    $0x10,%esp
     753:	85 c0                	test   %eax,%eax
     755:	74 76                	je     7cd <parseredirs+0xc9>
    tok = gettoken(ps, es, 0, 0);
     757:	6a 00                	push   $0x0
     759:	6a 00                	push   $0x0
     75b:	56                   	push   %esi
     75c:	57                   	push   %edi
     75d:	e8 27 fe ff ff       	call   589 <gettoken>
     762:	89 c3                	mov    %eax,%ebx
    if(gettoken(ps, es, &q, &eq) != 'a')
     764:	8d 45 e0             	lea    -0x20(%ebp),%eax
     767:	50                   	push   %eax
     768:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     76b:	50                   	push   %eax
     76c:	56                   	push   %esi
     76d:	57                   	push   %edi
     76e:	e8 16 fe ff ff       	call   589 <gettoken>
     773:	83 c4 20             	add    $0x20,%esp
     776:	83 f8 61             	cmp    $0x61,%eax
     779:	75 9e                	jne    719 <parseredirs+0x15>
    switch(tok){
     77b:	83 fb 3c             	cmp    $0x3c,%ebx
     77e:	74 a6                	je     726 <parseredirs+0x22>
     780:	83 fb 3e             	cmp    $0x3e,%ebx
     783:	74 25                	je     7aa <parseredirs+0xa6>
     785:	83 fb 2b             	cmp    $0x2b,%ebx
     788:	75 b7                	jne    741 <parseredirs+0x3d>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     78a:	83 ec 0c             	sub    $0xc,%esp
     78d:	6a 01                	push   $0x1
     78f:	68 01 02 00 00       	push   $0x201
     794:	ff 75 e0             	pushl  -0x20(%ebp)
     797:	ff 75 e4             	pushl  -0x1c(%ebp)
     79a:	ff 75 08             	pushl  0x8(%ebp)
     79d:	e8 f3 fc ff ff       	call   495 <redircmd>
     7a2:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     7a5:	83 c4 20             	add    $0x20,%esp
     7a8:	eb 97                	jmp    741 <parseredirs+0x3d>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     7aa:	83 ec 0c             	sub    $0xc,%esp
     7ad:	6a 01                	push   $0x1
     7af:	68 01 02 00 00       	push   $0x201
     7b4:	ff 75 e0             	pushl  -0x20(%ebp)
     7b7:	ff 75 e4             	pushl  -0x1c(%ebp)
     7ba:	ff 75 08             	pushl  0x8(%ebp)
     7bd:	e8 d3 fc ff ff       	call   495 <redircmd>
     7c2:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     7c5:	83 c4 20             	add    $0x20,%esp
     7c8:	e9 74 ff ff ff       	jmp    741 <parseredirs+0x3d>
    }
  }
  return cmd;
}
     7cd:	8b 45 08             	mov    0x8(%ebp),%eax
     7d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7d3:	5b                   	pop    %ebx
     7d4:	5e                   	pop    %esi
     7d5:	5f                   	pop    %edi
     7d6:	5d                   	pop    %ebp
     7d7:	c3                   	ret    

000007d8 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     7d8:	f3 0f 1e fb          	endbr32 
     7dc:	55                   	push   %ebp
     7dd:	89 e5                	mov    %esp,%ebp
     7df:	57                   	push   %edi
     7e0:	56                   	push   %esi
     7e1:	53                   	push   %ebx
     7e2:	83 ec 30             	sub    $0x30,%esp
     7e5:	8b 75 08             	mov    0x8(%ebp),%esi
     7e8:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     7eb:	68 f2 13 00 00       	push   $0x13f2
     7f0:	57                   	push   %edi
     7f1:	56                   	push   %esi
     7f2:	e8 9d fe ff ff       	call   694 <peek>
     7f7:	83 c4 10             	add    $0x10,%esp
     7fa:	85 c0                	test   %eax,%eax
     7fc:	75 1d                	jne    81b <parseexec+0x43>
     7fe:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     800:	e8 62 fc ff ff       	call   467 <execcmd>
     805:	89 45 d0             	mov    %eax,-0x30(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     808:	83 ec 04             	sub    $0x4,%esp
     80b:	57                   	push   %edi
     80c:	56                   	push   %esi
     80d:	50                   	push   %eax
     80e:	e8 f1 fe ff ff       	call   704 <parseredirs>
     813:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     816:	83 c4 10             	add    $0x10,%esp
     819:	eb 3b                	jmp    856 <parseexec+0x7e>
    return parseblock(ps, es);
     81b:	83 ec 08             	sub    $0x8,%esp
     81e:	57                   	push   %edi
     81f:	56                   	push   %esi
     820:	e8 97 01 00 00       	call   9bc <parseblock>
     825:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     828:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     82b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     82e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     831:	5b                   	pop    %ebx
     832:	5e                   	pop    %esi
     833:	5f                   	pop    %edi
     834:	5d                   	pop    %ebp
     835:	c3                   	ret    
      panic("syntax");
     836:	83 ec 0c             	sub    $0xc,%esp
     839:	68 f4 13 00 00       	push   $0x13f4
     83e:	e8 39 fa ff ff       	call   27c <panic>
    ret = parseredirs(ret, ps, es);
     843:	83 ec 04             	sub    $0x4,%esp
     846:	57                   	push   %edi
     847:	56                   	push   %esi
     848:	ff 75 d4             	pushl  -0x2c(%ebp)
     84b:	e8 b4 fe ff ff       	call   704 <parseredirs>
     850:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     853:	83 c4 10             	add    $0x10,%esp
  while(!peek(ps, es, "|)&;")){
     856:	83 ec 04             	sub    $0x4,%esp
     859:	68 09 14 00 00       	push   $0x1409
     85e:	57                   	push   %edi
     85f:	56                   	push   %esi
     860:	e8 2f fe ff ff       	call   694 <peek>
     865:	83 c4 10             	add    $0x10,%esp
     868:	85 c0                	test   %eax,%eax
     86a:	75 41                	jne    8ad <parseexec+0xd5>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     86c:	8d 45 e0             	lea    -0x20(%ebp),%eax
     86f:	50                   	push   %eax
     870:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     873:	50                   	push   %eax
     874:	57                   	push   %edi
     875:	56                   	push   %esi
     876:	e8 0e fd ff ff       	call   589 <gettoken>
     87b:	83 c4 10             	add    $0x10,%esp
     87e:	85 c0                	test   %eax,%eax
     880:	74 2b                	je     8ad <parseexec+0xd5>
    if(tok != 'a')
     882:	83 f8 61             	cmp    $0x61,%eax
     885:	75 af                	jne    836 <parseexec+0x5e>
    cmd->argv[argc] = q;
     887:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     88a:	8b 55 d0             	mov    -0x30(%ebp),%edx
     88d:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     891:	8b 45 e0             	mov    -0x20(%ebp),%eax
     894:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     898:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     89b:	83 fb 09             	cmp    $0x9,%ebx
     89e:	7e a3                	jle    843 <parseexec+0x6b>
      panic("too many args");
     8a0:	83 ec 0c             	sub    $0xc,%esp
     8a3:	68 fb 13 00 00       	push   $0x13fb
     8a8:	e8 cf f9 ff ff       	call   27c <panic>
  cmd->argv[argc] = 0;
     8ad:	8b 45 d0             	mov    -0x30(%ebp),%eax
     8b0:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
     8b7:	00 
  cmd->eargv[argc] = 0;
     8b8:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
     8bf:	00 
  return ret;
     8c0:	e9 66 ff ff ff       	jmp    82b <parseexec+0x53>

000008c5 <parsepipe>:
{
     8c5:	f3 0f 1e fb          	endbr32 
     8c9:	55                   	push   %ebp
     8ca:	89 e5                	mov    %esp,%ebp
     8cc:	57                   	push   %edi
     8cd:	56                   	push   %esi
     8ce:	53                   	push   %ebx
     8cf:	83 ec 14             	sub    $0x14,%esp
     8d2:	8b 75 08             	mov    0x8(%ebp),%esi
     8d5:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     8d8:	57                   	push   %edi
     8d9:	56                   	push   %esi
     8da:	e8 f9 fe ff ff       	call   7d8 <parseexec>
     8df:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8e1:	83 c4 0c             	add    $0xc,%esp
     8e4:	68 0e 14 00 00       	push   $0x140e
     8e9:	57                   	push   %edi
     8ea:	56                   	push   %esi
     8eb:	e8 a4 fd ff ff       	call   694 <peek>
     8f0:	83 c4 10             	add    $0x10,%esp
     8f3:	85 c0                	test   %eax,%eax
     8f5:	75 0a                	jne    901 <parsepipe+0x3c>
}
     8f7:	89 d8                	mov    %ebx,%eax
     8f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8fc:	5b                   	pop    %ebx
     8fd:	5e                   	pop    %esi
     8fe:	5f                   	pop    %edi
     8ff:	5d                   	pop    %ebp
     900:	c3                   	ret    
    gettoken(ps, es, 0, 0);
     901:	6a 00                	push   $0x0
     903:	6a 00                	push   $0x0
     905:	57                   	push   %edi
     906:	56                   	push   %esi
     907:	e8 7d fc ff ff       	call   589 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     90c:	83 c4 08             	add    $0x8,%esp
     90f:	57                   	push   %edi
     910:	56                   	push   %esi
     911:	e8 af ff ff ff       	call   8c5 <parsepipe>
     916:	83 c4 08             	add    $0x8,%esp
     919:	50                   	push   %eax
     91a:	53                   	push   %ebx
     91b:	e8 c1 fb ff ff       	call   4e1 <pipecmd>
     920:	89 c3                	mov    %eax,%ebx
     922:	83 c4 10             	add    $0x10,%esp
  return cmd;
     925:	eb d0                	jmp    8f7 <parsepipe+0x32>

00000927 <parseline>:
{
     927:	f3 0f 1e fb          	endbr32 
     92b:	55                   	push   %ebp
     92c:	89 e5                	mov    %esp,%ebp
     92e:	57                   	push   %edi
     92f:	56                   	push   %esi
     930:	53                   	push   %ebx
     931:	83 ec 14             	sub    $0x14,%esp
     934:	8b 75 08             	mov    0x8(%ebp),%esi
     937:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     93a:	57                   	push   %edi
     93b:	56                   	push   %esi
     93c:	e8 84 ff ff ff       	call   8c5 <parsepipe>
     941:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     943:	83 c4 10             	add    $0x10,%esp
     946:	83 ec 04             	sub    $0x4,%esp
     949:	68 10 14 00 00       	push   $0x1410
     94e:	57                   	push   %edi
     94f:	56                   	push   %esi
     950:	e8 3f fd ff ff       	call   694 <peek>
     955:	83 c4 10             	add    $0x10,%esp
     958:	85 c0                	test   %eax,%eax
     95a:	74 1a                	je     976 <parseline+0x4f>
    gettoken(ps, es, 0, 0);
     95c:	6a 00                	push   $0x0
     95e:	6a 00                	push   $0x0
     960:	57                   	push   %edi
     961:	56                   	push   %esi
     962:	e8 22 fc ff ff       	call   589 <gettoken>
    cmd = backcmd(cmd);
     967:	89 1c 24             	mov    %ebx,(%esp)
     96a:	e8 e6 fb ff ff       	call   555 <backcmd>
     96f:	89 c3                	mov    %eax,%ebx
     971:	83 c4 10             	add    $0x10,%esp
     974:	eb d0                	jmp    946 <parseline+0x1f>
  if(peek(ps, es, ";")){
     976:	83 ec 04             	sub    $0x4,%esp
     979:	68 0c 14 00 00       	push   $0x140c
     97e:	57                   	push   %edi
     97f:	56                   	push   %esi
     980:	e8 0f fd ff ff       	call   694 <peek>
     985:	83 c4 10             	add    $0x10,%esp
     988:	85 c0                	test   %eax,%eax
     98a:	75 0a                	jne    996 <parseline+0x6f>
}
     98c:	89 d8                	mov    %ebx,%eax
     98e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     991:	5b                   	pop    %ebx
     992:	5e                   	pop    %esi
     993:	5f                   	pop    %edi
     994:	5d                   	pop    %ebp
     995:	c3                   	ret    
    gettoken(ps, es, 0, 0);
     996:	6a 00                	push   $0x0
     998:	6a 00                	push   $0x0
     99a:	57                   	push   %edi
     99b:	56                   	push   %esi
     99c:	e8 e8 fb ff ff       	call   589 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9a1:	83 c4 08             	add    $0x8,%esp
     9a4:	57                   	push   %edi
     9a5:	56                   	push   %esi
     9a6:	e8 7c ff ff ff       	call   927 <parseline>
     9ab:	83 c4 08             	add    $0x8,%esp
     9ae:	50                   	push   %eax
     9af:	53                   	push   %ebx
     9b0:	e8 66 fb ff ff       	call   51b <listcmd>
     9b5:	89 c3                	mov    %eax,%ebx
     9b7:	83 c4 10             	add    $0x10,%esp
  return cmd;
     9ba:	eb d0                	jmp    98c <parseline+0x65>

000009bc <parseblock>:
{
     9bc:	f3 0f 1e fb          	endbr32 
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	57                   	push   %edi
     9c4:	56                   	push   %esi
     9c5:	53                   	push   %ebx
     9c6:	83 ec 10             	sub    $0x10,%esp
     9c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     9cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     9cf:	68 f2 13 00 00       	push   $0x13f2
     9d4:	56                   	push   %esi
     9d5:	53                   	push   %ebx
     9d6:	e8 b9 fc ff ff       	call   694 <peek>
     9db:	83 c4 10             	add    $0x10,%esp
     9de:	85 c0                	test   %eax,%eax
     9e0:	74 4b                	je     a2d <parseblock+0x71>
  gettoken(ps, es, 0, 0);
     9e2:	6a 00                	push   $0x0
     9e4:	6a 00                	push   $0x0
     9e6:	56                   	push   %esi
     9e7:	53                   	push   %ebx
     9e8:	e8 9c fb ff ff       	call   589 <gettoken>
  cmd = parseline(ps, es);
     9ed:	83 c4 08             	add    $0x8,%esp
     9f0:	56                   	push   %esi
     9f1:	53                   	push   %ebx
     9f2:	e8 30 ff ff ff       	call   927 <parseline>
     9f7:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     9f9:	83 c4 0c             	add    $0xc,%esp
     9fc:	68 2e 14 00 00       	push   $0x142e
     a01:	56                   	push   %esi
     a02:	53                   	push   %ebx
     a03:	e8 8c fc ff ff       	call   694 <peek>
     a08:	83 c4 10             	add    $0x10,%esp
     a0b:	85 c0                	test   %eax,%eax
     a0d:	74 2b                	je     a3a <parseblock+0x7e>
  gettoken(ps, es, 0, 0);
     a0f:	6a 00                	push   $0x0
     a11:	6a 00                	push   $0x0
     a13:	56                   	push   %esi
     a14:	53                   	push   %ebx
     a15:	e8 6f fb ff ff       	call   589 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a1a:	83 c4 0c             	add    $0xc,%esp
     a1d:	56                   	push   %esi
     a1e:	53                   	push   %ebx
     a1f:	57                   	push   %edi
     a20:	e8 df fc ff ff       	call   704 <parseredirs>
}
     a25:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a28:	5b                   	pop    %ebx
     a29:	5e                   	pop    %esi
     a2a:	5f                   	pop    %edi
     a2b:	5d                   	pop    %ebp
     a2c:	c3                   	ret    
    panic("parseblock");
     a2d:	83 ec 0c             	sub    $0xc,%esp
     a30:	68 12 14 00 00       	push   $0x1412
     a35:	e8 42 f8 ff ff       	call   27c <panic>
    panic("syntax - missing )");
     a3a:	83 ec 0c             	sub    $0xc,%esp
     a3d:	68 1d 14 00 00       	push   $0x141d
     a42:	e8 35 f8 ff ff       	call   27c <panic>

00000a47 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a47:	f3 0f 1e fb          	endbr32 
     a4b:	55                   	push   %ebp
     a4c:	89 e5                	mov    %esp,%ebp
     a4e:	53                   	push   %ebx
     a4f:	83 ec 04             	sub    $0x4,%esp
     a52:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a55:	85 db                	test   %ebx,%ebx
     a57:	74 3b                	je     a94 <nulterminate+0x4d>
    return 0;

  switch(cmd->type){
     a59:	8b 03                	mov    (%ebx),%eax
     a5b:	83 f8 05             	cmp    $0x5,%eax
     a5e:	77 34                	ja     a94 <nulterminate+0x4d>
     a60:	3e ff 24 85 74 14 00 	notrack jmp *0x1474(,%eax,4)
     a67:	00 
     a68:	b8 00 00 00 00       	mov    $0x0,%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     a6d:	83 7c 83 04 00       	cmpl   $0x0,0x4(%ebx,%eax,4)
     a72:	74 20                	je     a94 <nulterminate+0x4d>
      *ecmd->eargv[i] = 0;
     a74:	8b 54 83 2c          	mov    0x2c(%ebx,%eax,4),%edx
     a78:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     a7b:	83 c0 01             	add    $0x1,%eax
     a7e:	eb ed                	jmp    a6d <nulterminate+0x26>
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     a80:	83 ec 0c             	sub    $0xc,%esp
     a83:	ff 73 04             	pushl  0x4(%ebx)
     a86:	e8 bc ff ff ff       	call   a47 <nulterminate>
    *rcmd->efile = 0;
     a8b:	8b 43 0c             	mov    0xc(%ebx),%eax
     a8e:	c6 00 00             	movb   $0x0,(%eax)
    break;
     a91:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a94:	89 d8                	mov    %ebx,%eax
     a96:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a99:	c9                   	leave  
     a9a:	c3                   	ret    
    nulterminate(pcmd->left);
     a9b:	83 ec 0c             	sub    $0xc,%esp
     a9e:	ff 73 04             	pushl  0x4(%ebx)
     aa1:	e8 a1 ff ff ff       	call   a47 <nulterminate>
    nulterminate(pcmd->right);
     aa6:	83 c4 04             	add    $0x4,%esp
     aa9:	ff 73 08             	pushl  0x8(%ebx)
     aac:	e8 96 ff ff ff       	call   a47 <nulterminate>
    break;
     ab1:	83 c4 10             	add    $0x10,%esp
     ab4:	eb de                	jmp    a94 <nulterminate+0x4d>
    nulterminate(lcmd->left);
     ab6:	83 ec 0c             	sub    $0xc,%esp
     ab9:	ff 73 04             	pushl  0x4(%ebx)
     abc:	e8 86 ff ff ff       	call   a47 <nulterminate>
    nulterminate(lcmd->right);
     ac1:	83 c4 04             	add    $0x4,%esp
     ac4:	ff 73 08             	pushl  0x8(%ebx)
     ac7:	e8 7b ff ff ff       	call   a47 <nulterminate>
    break;
     acc:	83 c4 10             	add    $0x10,%esp
     acf:	eb c3                	jmp    a94 <nulterminate+0x4d>
    nulterminate(bcmd->cmd);
     ad1:	83 ec 0c             	sub    $0xc,%esp
     ad4:	ff 73 04             	pushl  0x4(%ebx)
     ad7:	e8 6b ff ff ff       	call   a47 <nulterminate>
    break;
     adc:	83 c4 10             	add    $0x10,%esp
     adf:	eb b3                	jmp    a94 <nulterminate+0x4d>

00000ae1 <parsecmd>:
{
     ae1:	f3 0f 1e fb          	endbr32 
     ae5:	55                   	push   %ebp
     ae6:	89 e5                	mov    %esp,%ebp
     ae8:	56                   	push   %esi
     ae9:	53                   	push   %ebx
  es = s + strlen(s);
     aea:	8b 5d 08             	mov    0x8(%ebp),%ebx
     aed:	83 ec 0c             	sub    $0xc,%esp
     af0:	53                   	push   %ebx
     af1:	e8 e2 01 00 00       	call   cd8 <strlen>
     af6:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     af8:	83 c4 08             	add    $0x8,%esp
     afb:	53                   	push   %ebx
     afc:	8d 45 08             	lea    0x8(%ebp),%eax
     aff:	50                   	push   %eax
     b00:	e8 22 fe ff ff       	call   927 <parseline>
     b05:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b07:	83 c4 0c             	add    $0xc,%esp
     b0a:	68 85 13 00 00       	push   $0x1385
     b0f:	53                   	push   %ebx
     b10:	8d 45 08             	lea    0x8(%ebp),%eax
     b13:	50                   	push   %eax
     b14:	e8 7b fb ff ff       	call   694 <peek>
  if(s != es){
     b19:	8b 45 08             	mov    0x8(%ebp),%eax
     b1c:	83 c4 10             	add    $0x10,%esp
     b1f:	39 d8                	cmp    %ebx,%eax
     b21:	75 12                	jne    b35 <parsecmd+0x54>
  nulterminate(cmd);
     b23:	83 ec 0c             	sub    $0xc,%esp
     b26:	56                   	push   %esi
     b27:	e8 1b ff ff ff       	call   a47 <nulterminate>
}
     b2c:	89 f0                	mov    %esi,%eax
     b2e:	8d 65 f8             	lea    -0x8(%ebp),%esp
     b31:	5b                   	pop    %ebx
     b32:	5e                   	pop    %esi
     b33:	5d                   	pop    %ebp
     b34:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     b35:	83 ec 04             	sub    $0x4,%esp
     b38:	50                   	push   %eax
     b39:	68 30 14 00 00       	push   $0x1430
     b3e:	6a 02                	push   $0x2
     b40:	e8 56 05 00 00       	call   109b <printf>
    panic("syntax");
     b45:	c7 04 24 f4 13 00 00 	movl   $0x13f4,(%esp)
     b4c:	e8 2b f7 ff ff       	call   27c <panic>

00000b51 <main>:
{
     b51:	f3 0f 1e fb          	endbr32 
     b55:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     b59:	83 e4 f0             	and    $0xfffffff0,%esp
     b5c:	ff 71 fc             	pushl  -0x4(%ecx)
     b5f:	55                   	push   %ebp
     b60:	89 e5                	mov    %esp,%ebp
     b62:	51                   	push   %ecx
     b63:	83 ec 04             	sub    $0x4,%esp
  while((fd = open("console", O_RDWR)) >= 0){
     b66:	83 ec 08             	sub    $0x8,%esp
     b69:	6a 02                	push   $0x2
     b6b:	68 3f 14 00 00       	push   $0x143f
     b70:	e8 e5 03 00 00       	call   f5a <open>
     b75:	83 c4 10             	add    $0x10,%esp
     b78:	85 c0                	test   %eax,%eax
     b7a:	0f 88 80 00 00 00    	js     c00 <main+0xaf>
    if(fd >= 3){
     b80:	83 f8 02             	cmp    $0x2,%eax
     b83:	7e e1                	jle    b66 <main+0x15>
      close(fd);
     b85:	83 ec 0c             	sub    $0xc,%esp
     b88:	50                   	push   %eax
     b89:	e8 b4 03 00 00       	call   f42 <close>
      break;
     b8e:	83 c4 10             	add    $0x10,%esp
     b91:	eb 6d                	jmp    c00 <main+0xaf>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     b93:	80 3d 21 1b 00 00 64 	cmpb   $0x64,0x1b21
     b9a:	0f 85 85 00 00 00    	jne    c25 <main+0xd4>
     ba0:	80 3d 22 1b 00 00 20 	cmpb   $0x20,0x1b22
     ba7:	75 7c                	jne    c25 <main+0xd4>
      buf[strlen(buf)-1] = 0;  // chop \n
     ba9:	83 ec 0c             	sub    $0xc,%esp
     bac:	68 20 1b 00 00       	push   $0x1b20
     bb1:	e8 22 01 00 00       	call   cd8 <strlen>
     bb6:	c6 80 1f 1b 00 00 00 	movb   $0x0,0x1b1f(%eax)
      if(chdir(buf+3) < 0)
     bbd:	c7 04 24 23 1b 00 00 	movl   $0x1b23,(%esp)
     bc4:	e8 c1 03 00 00       	call   f8a <chdir>
     bc9:	83 c4 10             	add    $0x10,%esp
     bcc:	85 c0                	test   %eax,%eax
     bce:	79 30                	jns    c00 <main+0xaf>
        printf(2, "cannot cd %s\n", buf+3);
     bd0:	83 ec 04             	sub    $0x4,%esp
     bd3:	68 23 1b 00 00       	push   $0x1b23
     bd8:	68 47 14 00 00       	push   $0x1447
     bdd:	6a 02                	push   $0x2
     bdf:	e8 b7 04 00 00       	call   109b <printf>
     be4:	83 c4 10             	add    $0x10,%esp
      continue;
     be7:	eb 17                	jmp    c00 <main+0xaf>
    if (buf[0]=='_') {     // assume it is a builtin command
     be9:	80 3d 20 1b 00 00 5f 	cmpb   $0x5f,0x1b20
     bf0:	74 66                	je     c58 <main+0x107>
    if(fork1() == 0)
     bf2:	e8 a3 f6 ff ff       	call   29a <fork1>
     bf7:	85 c0                	test   %eax,%eax
     bf9:	74 6f                	je     c6a <main+0x119>
    wait();
     bfb:	e8 22 03 00 00       	call   f22 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     c00:	83 ec 08             	sub    $0x8,%esp
     c03:	6a 64                	push   $0x64
     c05:	68 20 1b 00 00       	push   $0x1b20
     c0a:	e8 c2 f5 ff ff       	call   1d1 <getcmd>
     c0f:	83 c4 10             	add    $0x10,%esp
     c12:	85 c0                	test   %eax,%eax
     c14:	78 69                	js     c7f <main+0x12e>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     c16:	0f b6 05 20 1b 00 00 	movzbl 0x1b20,%eax
     c1d:	3c 63                	cmp    $0x63,%al
     c1f:	0f 84 6e ff ff ff    	je     b93 <main+0x42>
    if ((buf[0] != '\n') && (strncmp(buf, "exit", strlen(buf)-1) == 0)) { // ignore '\n'
     c25:	3c 0a                	cmp    $0xa,%al
     c27:	74 c0                	je     be9 <main+0x98>
     c29:	83 ec 0c             	sub    $0xc,%esp
     c2c:	68 20 1b 00 00       	push   $0x1b20
     c31:	e8 a2 00 00 00       	call   cd8 <strlen>
     c36:	83 c4 0c             	add    $0xc,%esp
     c39:	83 e8 01             	sub    $0x1,%eax
     c3c:	50                   	push   %eax
     c3d:	68 55 14 00 00       	push   $0x1455
     c42:	68 20 1b 00 00       	push   $0x1b20
     c47:	e8 55 02 00 00       	call   ea1 <strncmp>
     c4c:	83 c4 10             	add    $0x10,%esp
     c4f:	85 c0                	test   %eax,%eax
     c51:	75 96                	jne    be9 <main+0x98>
      exit();
     c53:	e8 c2 02 00 00       	call   f1a <exit>
      dobuiltin(buf);
     c58:	83 ec 0c             	sub    $0xc,%esp
     c5b:	68 20 1b 00 00       	push   $0x1b20
     c60:	e8 bb f5 ff ff       	call   220 <dobuiltin>
      continue;
     c65:	83 c4 10             	add    $0x10,%esp
     c68:	eb 96                	jmp    c00 <main+0xaf>
      runcmd(parsecmd(buf));
     c6a:	83 ec 0c             	sub    $0xc,%esp
     c6d:	68 20 1b 00 00       	push   $0x1b20
     c72:	e8 6a fe ff ff       	call   ae1 <parsecmd>
     c77:	89 04 24             	mov    %eax,(%esp)
     c7a:	e8 3e f6 ff ff       	call   2bd <runcmd>
  exit();
     c7f:	e8 96 02 00 00       	call   f1a <exit>

00000c84 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     c84:	f3 0f 1e fb          	endbr32 
     c88:	55                   	push   %ebp
     c89:	89 e5                	mov    %esp,%ebp
     c8b:	56                   	push   %esi
     c8c:	53                   	push   %ebx
     c8d:	8b 75 08             	mov    0x8(%ebp),%esi
     c90:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     c93:	89 f0                	mov    %esi,%eax
     c95:	89 d1                	mov    %edx,%ecx
     c97:	83 c2 01             	add    $0x1,%edx
     c9a:	89 c3                	mov    %eax,%ebx
     c9c:	83 c0 01             	add    $0x1,%eax
     c9f:	0f b6 09             	movzbl (%ecx),%ecx
     ca2:	88 0b                	mov    %cl,(%ebx)
     ca4:	84 c9                	test   %cl,%cl
     ca6:	75 ed                	jne    c95 <strcpy+0x11>
    ;
  return os;
}
     ca8:	89 f0                	mov    %esi,%eax
     caa:	5b                   	pop    %ebx
     cab:	5e                   	pop    %esi
     cac:	5d                   	pop    %ebp
     cad:	c3                   	ret    

00000cae <strcmp>:

int
strcmp(const char *p, const char *q)
{
     cae:	f3 0f 1e fb          	endbr32 
     cb2:	55                   	push   %ebp
     cb3:	89 e5                	mov    %esp,%ebp
     cb5:	8b 4d 08             	mov    0x8(%ebp),%ecx
     cb8:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     cbb:	0f b6 01             	movzbl (%ecx),%eax
     cbe:	84 c0                	test   %al,%al
     cc0:	74 0c                	je     cce <strcmp+0x20>
     cc2:	3a 02                	cmp    (%edx),%al
     cc4:	75 08                	jne    cce <strcmp+0x20>
    p++, q++;
     cc6:	83 c1 01             	add    $0x1,%ecx
     cc9:	83 c2 01             	add    $0x1,%edx
     ccc:	eb ed                	jmp    cbb <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
     cce:	0f b6 c0             	movzbl %al,%eax
     cd1:	0f b6 12             	movzbl (%edx),%edx
     cd4:	29 d0                	sub    %edx,%eax
}
     cd6:	5d                   	pop    %ebp
     cd7:	c3                   	ret    

00000cd8 <strlen>:

uint
strlen(char *s)
{
     cd8:	f3 0f 1e fb          	endbr32 
     cdc:	55                   	push   %ebp
     cdd:	89 e5                	mov    %esp,%ebp
     cdf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     ce2:	b8 00 00 00 00       	mov    $0x0,%eax
     ce7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
     ceb:	74 05                	je     cf2 <strlen+0x1a>
     ced:	83 c0 01             	add    $0x1,%eax
     cf0:	eb f5                	jmp    ce7 <strlen+0xf>
    ;
  return n;
}
     cf2:	5d                   	pop    %ebp
     cf3:	c3                   	ret    

00000cf4 <memset>:

void*
memset(void *dst, int c, uint n)
{
     cf4:	f3 0f 1e fb          	endbr32 
     cf8:	55                   	push   %ebp
     cf9:	89 e5                	mov    %esp,%ebp
     cfb:	57                   	push   %edi
     cfc:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     cff:	89 d7                	mov    %edx,%edi
     d01:	8b 4d 10             	mov    0x10(%ebp),%ecx
     d04:	8b 45 0c             	mov    0xc(%ebp),%eax
     d07:	fc                   	cld    
     d08:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     d0a:	89 d0                	mov    %edx,%eax
     d0c:	5f                   	pop    %edi
     d0d:	5d                   	pop    %ebp
     d0e:	c3                   	ret    

00000d0f <strchr>:

char*
strchr(const char *s, char c)
{
     d0f:	f3 0f 1e fb          	endbr32 
     d13:	55                   	push   %ebp
     d14:	89 e5                	mov    %esp,%ebp
     d16:	8b 45 08             	mov    0x8(%ebp),%eax
     d19:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     d1d:	0f b6 10             	movzbl (%eax),%edx
     d20:	84 d2                	test   %dl,%dl
     d22:	74 09                	je     d2d <strchr+0x1e>
    if(*s == c)
     d24:	38 ca                	cmp    %cl,%dl
     d26:	74 0a                	je     d32 <strchr+0x23>
  for(; *s; s++)
     d28:	83 c0 01             	add    $0x1,%eax
     d2b:	eb f0                	jmp    d1d <strchr+0xe>
      return (char*)s;
  return 0;
     d2d:	b8 00 00 00 00       	mov    $0x0,%eax
}
     d32:	5d                   	pop    %ebp
     d33:	c3                   	ret    

00000d34 <gets>:

char*
gets(char *buf, int max)
{
     d34:	f3 0f 1e fb          	endbr32 
     d38:	55                   	push   %ebp
     d39:	89 e5                	mov    %esp,%ebp
     d3b:	57                   	push   %edi
     d3c:	56                   	push   %esi
     d3d:	53                   	push   %ebx
     d3e:	83 ec 1c             	sub    $0x1c,%esp
     d41:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     d44:	bb 00 00 00 00       	mov    $0x0,%ebx
     d49:	89 de                	mov    %ebx,%esi
     d4b:	83 c3 01             	add    $0x1,%ebx
     d4e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d51:	7d 2e                	jge    d81 <gets+0x4d>
    cc = read(0, &c, 1);
     d53:	83 ec 04             	sub    $0x4,%esp
     d56:	6a 01                	push   $0x1
     d58:	8d 45 e7             	lea    -0x19(%ebp),%eax
     d5b:	50                   	push   %eax
     d5c:	6a 00                	push   $0x0
     d5e:	e8 cf 01 00 00       	call   f32 <read>
    if(cc < 1)
     d63:	83 c4 10             	add    $0x10,%esp
     d66:	85 c0                	test   %eax,%eax
     d68:	7e 17                	jle    d81 <gets+0x4d>
      break;
    buf[i++] = c;
     d6a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d6e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
     d71:	3c 0a                	cmp    $0xa,%al
     d73:	0f 94 c2             	sete   %dl
     d76:	3c 0d                	cmp    $0xd,%al
     d78:	0f 94 c0             	sete   %al
     d7b:	08 c2                	or     %al,%dl
     d7d:	74 ca                	je     d49 <gets+0x15>
    buf[i++] = c;
     d7f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
     d81:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
     d85:	89 f8                	mov    %edi,%eax
     d87:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d8a:	5b                   	pop    %ebx
     d8b:	5e                   	pop    %esi
     d8c:	5f                   	pop    %edi
     d8d:	5d                   	pop    %ebp
     d8e:	c3                   	ret    

00000d8f <stat>:

int
stat(char *n, struct stat *st)
{
     d8f:	f3 0f 1e fb          	endbr32 
     d93:	55                   	push   %ebp
     d94:	89 e5                	mov    %esp,%ebp
     d96:	56                   	push   %esi
     d97:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d98:	83 ec 08             	sub    $0x8,%esp
     d9b:	6a 00                	push   $0x0
     d9d:	ff 75 08             	pushl  0x8(%ebp)
     da0:	e8 b5 01 00 00       	call   f5a <open>
  if(fd < 0)
     da5:	83 c4 10             	add    $0x10,%esp
     da8:	85 c0                	test   %eax,%eax
     daa:	78 24                	js     dd0 <stat+0x41>
     dac:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
     dae:	83 ec 08             	sub    $0x8,%esp
     db1:	ff 75 0c             	pushl  0xc(%ebp)
     db4:	50                   	push   %eax
     db5:	e8 b8 01 00 00       	call   f72 <fstat>
     dba:	89 c6                	mov    %eax,%esi
  close(fd);
     dbc:	89 1c 24             	mov    %ebx,(%esp)
     dbf:	e8 7e 01 00 00       	call   f42 <close>
  return r;
     dc4:	83 c4 10             	add    $0x10,%esp
}
     dc7:	89 f0                	mov    %esi,%eax
     dc9:	8d 65 f8             	lea    -0x8(%ebp),%esp
     dcc:	5b                   	pop    %ebx
     dcd:	5e                   	pop    %esi
     dce:	5d                   	pop    %ebp
     dcf:	c3                   	ret    
    return -1;
     dd0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     dd5:	eb f0                	jmp    dc7 <stat+0x38>

00000dd7 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
     dd7:	f3 0f 1e fb          	endbr32 
     ddb:	55                   	push   %ebp
     ddc:	89 e5                	mov    %esp,%ebp
     dde:	57                   	push   %edi
     ddf:	56                   	push   %esi
     de0:	53                   	push   %ebx
     de1:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
     de4:	0f b6 02             	movzbl (%edx),%eax
     de7:	3c 20                	cmp    $0x20,%al
     de9:	75 05                	jne    df0 <atoi+0x19>
     deb:	83 c2 01             	add    $0x1,%edx
     dee:	eb f4                	jmp    de4 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
     df0:	3c 2d                	cmp    $0x2d,%al
     df2:	74 1d                	je     e11 <atoi+0x3a>
     df4:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
     df9:	3c 2b                	cmp    $0x2b,%al
     dfb:	0f 94 c1             	sete   %cl
     dfe:	3c 2d                	cmp    $0x2d,%al
     e00:	0f 94 c0             	sete   %al
     e03:	08 c1                	or     %al,%cl
     e05:	74 03                	je     e0a <atoi+0x33>
    s++;
     e07:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
     e0a:	b8 00 00 00 00       	mov    $0x0,%eax
     e0f:	eb 17                	jmp    e28 <atoi+0x51>
     e11:	bf ff ff ff ff       	mov    $0xffffffff,%edi
     e16:	eb e1                	jmp    df9 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
     e18:	8d 34 80             	lea    (%eax,%eax,4),%esi
     e1b:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
     e1e:	83 c2 01             	add    $0x1,%edx
     e21:	0f be c9             	movsbl %cl,%ecx
     e24:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
     e28:	0f b6 0a             	movzbl (%edx),%ecx
     e2b:	8d 59 d0             	lea    -0x30(%ecx),%ebx
     e2e:	80 fb 09             	cmp    $0x9,%bl
     e31:	76 e5                	jbe    e18 <atoi+0x41>
  return sign*n;
     e33:	0f af c7             	imul   %edi,%eax
}
     e36:	5b                   	pop    %ebx
     e37:	5e                   	pop    %esi
     e38:	5f                   	pop    %edi
     e39:	5d                   	pop    %ebp
     e3a:	c3                   	ret    

00000e3b <atoo>:

int
atoo(const char *s)
{
     e3b:	f3 0f 1e fb          	endbr32 
     e3f:	55                   	push   %ebp
     e40:	89 e5                	mov    %esp,%ebp
     e42:	57                   	push   %edi
     e43:	56                   	push   %esi
     e44:	53                   	push   %ebx
     e45:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
     e48:	0f b6 0a             	movzbl (%edx),%ecx
     e4b:	80 f9 20             	cmp    $0x20,%cl
     e4e:	75 05                	jne    e55 <atoo+0x1a>
     e50:	83 c2 01             	add    $0x1,%edx
     e53:	eb f3                	jmp    e48 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
     e55:	80 f9 2d             	cmp    $0x2d,%cl
     e58:	74 23                	je     e7d <atoo+0x42>
     e5a:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
     e5f:	80 f9 2b             	cmp    $0x2b,%cl
     e62:	0f 94 c0             	sete   %al
     e65:	89 c6                	mov    %eax,%esi
     e67:	80 f9 2d             	cmp    $0x2d,%cl
     e6a:	0f 94 c0             	sete   %al
     e6d:	89 f3                	mov    %esi,%ebx
     e6f:	08 c3                	or     %al,%bl
     e71:	74 03                	je     e76 <atoo+0x3b>
    s++;
     e73:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
     e76:	b8 00 00 00 00       	mov    $0x0,%eax
     e7b:	eb 11                	jmp    e8e <atoo+0x53>
     e7d:	bf ff ff ff ff       	mov    $0xffffffff,%edi
     e82:	eb db                	jmp    e5f <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
     e84:	83 c2 01             	add    $0x1,%edx
     e87:	0f be c9             	movsbl %cl,%ecx
     e8a:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
     e8e:	0f b6 0a             	movzbl (%edx),%ecx
     e91:	8d 59 d0             	lea    -0x30(%ecx),%ebx
     e94:	80 fb 07             	cmp    $0x7,%bl
     e97:	76 eb                	jbe    e84 <atoo+0x49>
  return sign*n;
     e99:	0f af c7             	imul   %edi,%eax
}
     e9c:	5b                   	pop    %ebx
     e9d:	5e                   	pop    %esi
     e9e:	5f                   	pop    %edi
     e9f:	5d                   	pop    %ebp
     ea0:	c3                   	ret    

00000ea1 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
     ea1:	f3 0f 1e fb          	endbr32 
     ea5:	55                   	push   %ebp
     ea6:	89 e5                	mov    %esp,%ebp
     ea8:	53                   	push   %ebx
     ea9:	8b 55 08             	mov    0x8(%ebp),%edx
     eac:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     eaf:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
     eb2:	eb 09                	jmp    ebd <strncmp+0x1c>
      n--, p++, q++;
     eb4:	83 e8 01             	sub    $0x1,%eax
     eb7:	83 c2 01             	add    $0x1,%edx
     eba:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
     ebd:	85 c0                	test   %eax,%eax
     ebf:	74 0b                	je     ecc <strncmp+0x2b>
     ec1:	0f b6 1a             	movzbl (%edx),%ebx
     ec4:	84 db                	test   %bl,%bl
     ec6:	74 04                	je     ecc <strncmp+0x2b>
     ec8:	3a 19                	cmp    (%ecx),%bl
     eca:	74 e8                	je     eb4 <strncmp+0x13>
    if(n == 0)
     ecc:	85 c0                	test   %eax,%eax
     ece:	74 0b                	je     edb <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
     ed0:	0f b6 02             	movzbl (%edx),%eax
     ed3:	0f b6 11             	movzbl (%ecx),%edx
     ed6:	29 d0                	sub    %edx,%eax
}
     ed8:	5b                   	pop    %ebx
     ed9:	5d                   	pop    %ebp
     eda:	c3                   	ret    
      return 0;
     edb:	b8 00 00 00 00       	mov    $0x0,%eax
     ee0:	eb f6                	jmp    ed8 <strncmp+0x37>

00000ee2 <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
     ee2:	f3 0f 1e fb          	endbr32 
     ee6:	55                   	push   %ebp
     ee7:	89 e5                	mov    %esp,%ebp
     ee9:	56                   	push   %esi
     eea:	53                   	push   %ebx
     eeb:	8b 75 08             	mov    0x8(%ebp),%esi
     eee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     ef1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
     ef4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
     ef6:	8d 58 ff             	lea    -0x1(%eax),%ebx
     ef9:	85 c0                	test   %eax,%eax
     efb:	7e 0f                	jle    f0c <memmove+0x2a>
    *dst++ = *src++;
     efd:	0f b6 01             	movzbl (%ecx),%eax
     f00:	88 02                	mov    %al,(%edx)
     f02:	8d 49 01             	lea    0x1(%ecx),%ecx
     f05:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
     f08:	89 d8                	mov    %ebx,%eax
     f0a:	eb ea                	jmp    ef6 <memmove+0x14>
  return vdst;
}
     f0c:	89 f0                	mov    %esi,%eax
     f0e:	5b                   	pop    %ebx
     f0f:	5e                   	pop    %esi
     f10:	5d                   	pop    %ebp
     f11:	c3                   	ret    

00000f12 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     f12:	b8 01 00 00 00       	mov    $0x1,%eax
     f17:	cd 40                	int    $0x40
     f19:	c3                   	ret    

00000f1a <exit>:
SYSCALL(exit)
     f1a:	b8 02 00 00 00       	mov    $0x2,%eax
     f1f:	cd 40                	int    $0x40
     f21:	c3                   	ret    

00000f22 <wait>:
SYSCALL(wait)
     f22:	b8 03 00 00 00       	mov    $0x3,%eax
     f27:	cd 40                	int    $0x40
     f29:	c3                   	ret    

00000f2a <pipe>:
SYSCALL(pipe)
     f2a:	b8 04 00 00 00       	mov    $0x4,%eax
     f2f:	cd 40                	int    $0x40
     f31:	c3                   	ret    

00000f32 <read>:
SYSCALL(read)
     f32:	b8 05 00 00 00       	mov    $0x5,%eax
     f37:	cd 40                	int    $0x40
     f39:	c3                   	ret    

00000f3a <write>:
SYSCALL(write)
     f3a:	b8 10 00 00 00       	mov    $0x10,%eax
     f3f:	cd 40                	int    $0x40
     f41:	c3                   	ret    

00000f42 <close>:
SYSCALL(close)
     f42:	b8 15 00 00 00       	mov    $0x15,%eax
     f47:	cd 40                	int    $0x40
     f49:	c3                   	ret    

00000f4a <kill>:
SYSCALL(kill)
     f4a:	b8 06 00 00 00       	mov    $0x6,%eax
     f4f:	cd 40                	int    $0x40
     f51:	c3                   	ret    

00000f52 <exec>:
SYSCALL(exec)
     f52:	b8 07 00 00 00       	mov    $0x7,%eax
     f57:	cd 40                	int    $0x40
     f59:	c3                   	ret    

00000f5a <open>:
SYSCALL(open)
     f5a:	b8 0f 00 00 00       	mov    $0xf,%eax
     f5f:	cd 40                	int    $0x40
     f61:	c3                   	ret    

00000f62 <mknod>:
SYSCALL(mknod)
     f62:	b8 11 00 00 00       	mov    $0x11,%eax
     f67:	cd 40                	int    $0x40
     f69:	c3                   	ret    

00000f6a <unlink>:
SYSCALL(unlink)
     f6a:	b8 12 00 00 00       	mov    $0x12,%eax
     f6f:	cd 40                	int    $0x40
     f71:	c3                   	ret    

00000f72 <fstat>:
SYSCALL(fstat)
     f72:	b8 08 00 00 00       	mov    $0x8,%eax
     f77:	cd 40                	int    $0x40
     f79:	c3                   	ret    

00000f7a <link>:
SYSCALL(link)
     f7a:	b8 13 00 00 00       	mov    $0x13,%eax
     f7f:	cd 40                	int    $0x40
     f81:	c3                   	ret    

00000f82 <mkdir>:
SYSCALL(mkdir)
     f82:	b8 14 00 00 00       	mov    $0x14,%eax
     f87:	cd 40                	int    $0x40
     f89:	c3                   	ret    

00000f8a <chdir>:
SYSCALL(chdir)
     f8a:	b8 09 00 00 00       	mov    $0x9,%eax
     f8f:	cd 40                	int    $0x40
     f91:	c3                   	ret    

00000f92 <dup>:
SYSCALL(dup)
     f92:	b8 0a 00 00 00       	mov    $0xa,%eax
     f97:	cd 40                	int    $0x40
     f99:	c3                   	ret    

00000f9a <getpid>:
SYSCALL(getpid)
     f9a:	b8 0b 00 00 00       	mov    $0xb,%eax
     f9f:	cd 40                	int    $0x40
     fa1:	c3                   	ret    

00000fa2 <sbrk>:
SYSCALL(sbrk)
     fa2:	b8 0c 00 00 00       	mov    $0xc,%eax
     fa7:	cd 40                	int    $0x40
     fa9:	c3                   	ret    

00000faa <sleep>:
SYSCALL(sleep)
     faa:	b8 0d 00 00 00       	mov    $0xd,%eax
     faf:	cd 40                	int    $0x40
     fb1:	c3                   	ret    

00000fb2 <uptime>:
SYSCALL(uptime)
     fb2:	b8 0e 00 00 00       	mov    $0xe,%eax
     fb7:	cd 40                	int    $0x40
     fb9:	c3                   	ret    

00000fba <halt>:
SYSCALL(halt)
     fba:	b8 16 00 00 00       	mov    $0x16,%eax
     fbf:	cd 40                	int    $0x40
     fc1:	c3                   	ret    

00000fc2 <date>:
SYSCALL(date)
     fc2:	b8 17 00 00 00       	mov    $0x17,%eax
     fc7:	cd 40                	int    $0x40
     fc9:	c3                   	ret    

00000fca <getuid>:
SYSCALL(getuid)
     fca:	b8 18 00 00 00       	mov    $0x18,%eax
     fcf:	cd 40                	int    $0x40
     fd1:	c3                   	ret    

00000fd2 <getgid>:
SYSCALL(getgid)
     fd2:	b8 19 00 00 00       	mov    $0x19,%eax
     fd7:	cd 40                	int    $0x40
     fd9:	c3                   	ret    

00000fda <getppid>:
SYSCALL(getppid)
     fda:	b8 1a 00 00 00       	mov    $0x1a,%eax
     fdf:	cd 40                	int    $0x40
     fe1:	c3                   	ret    

00000fe2 <setuid>:
SYSCALL(setuid)
     fe2:	b8 1b 00 00 00       	mov    $0x1b,%eax
     fe7:	cd 40                	int    $0x40
     fe9:	c3                   	ret    

00000fea <setgid>:
SYSCALL(setgid)
     fea:	b8 1c 00 00 00       	mov    $0x1c,%eax
     fef:	cd 40                	int    $0x40
     ff1:	c3                   	ret    

00000ff2 <getprocs>:
     ff2:	b8 1d 00 00 00       	mov    $0x1d,%eax
     ff7:	cd 40                	int    $0x40
     ff9:	c3                   	ret    

00000ffa <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     ffa:	55                   	push   %ebp
     ffb:	89 e5                	mov    %esp,%ebp
     ffd:	83 ec 1c             	sub    $0x1c,%esp
    1000:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
    1003:	6a 01                	push   $0x1
    1005:	8d 55 f4             	lea    -0xc(%ebp),%edx
    1008:	52                   	push   %edx
    1009:	50                   	push   %eax
    100a:	e8 2b ff ff ff       	call   f3a <write>
}
    100f:	83 c4 10             	add    $0x10,%esp
    1012:	c9                   	leave  
    1013:	c3                   	ret    

00001014 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1014:	55                   	push   %ebp
    1015:	89 e5                	mov    %esp,%ebp
    1017:	57                   	push   %edi
    1018:	56                   	push   %esi
    1019:	53                   	push   %ebx
    101a:	83 ec 2c             	sub    $0x2c,%esp
    101d:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1020:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1022:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1026:	0f 95 c2             	setne  %dl
    1029:	89 f0                	mov    %esi,%eax
    102b:	c1 e8 1f             	shr    $0x1f,%eax
    102e:	84 c2                	test   %al,%dl
    1030:	74 42                	je     1074 <printint+0x60>
    neg = 1;
    x = -xx;
    1032:	f7 de                	neg    %esi
    neg = 1;
    1034:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    103b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
    1040:	89 f0                	mov    %esi,%eax
    1042:	ba 00 00 00 00       	mov    $0x0,%edx
    1047:	f7 f1                	div    %ecx
    1049:	89 df                	mov    %ebx,%edi
    104b:	83 c3 01             	add    $0x1,%ebx
    104e:	0f b6 92 94 14 00 00 	movzbl 0x1494(%edx),%edx
    1055:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
    1059:	89 f2                	mov    %esi,%edx
    105b:	89 c6                	mov    %eax,%esi
    105d:	39 d1                	cmp    %edx,%ecx
    105f:	76 df                	jbe    1040 <printint+0x2c>
  if(neg)
    1061:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    1065:	74 2f                	je     1096 <printint+0x82>
    buf[i++] = '-';
    1067:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    106c:	8d 5f 02             	lea    0x2(%edi),%ebx
    106f:	8b 75 d0             	mov    -0x30(%ebp),%esi
    1072:	eb 15                	jmp    1089 <printint+0x75>
  neg = 0;
    1074:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    107b:	eb be                	jmp    103b <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
    107d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
    1082:	89 f0                	mov    %esi,%eax
    1084:	e8 71 ff ff ff       	call   ffa <putc>
  while(--i >= 0)
    1089:	83 eb 01             	sub    $0x1,%ebx
    108c:	79 ef                	jns    107d <printint+0x69>
}
    108e:	83 c4 2c             	add    $0x2c,%esp
    1091:	5b                   	pop    %ebx
    1092:	5e                   	pop    %esi
    1093:	5f                   	pop    %edi
    1094:	5d                   	pop    %ebp
    1095:	c3                   	ret    
    1096:	8b 75 d0             	mov    -0x30(%ebp),%esi
    1099:	eb ee                	jmp    1089 <printint+0x75>

0000109b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    109b:	f3 0f 1e fb          	endbr32 
    109f:	55                   	push   %ebp
    10a0:	89 e5                	mov    %esp,%ebp
    10a2:	57                   	push   %edi
    10a3:	56                   	push   %esi
    10a4:	53                   	push   %ebx
    10a5:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    10a8:	8d 45 10             	lea    0x10(%ebp),%eax
    10ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
    10ae:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
    10b3:	bb 00 00 00 00       	mov    $0x0,%ebx
    10b8:	eb 14                	jmp    10ce <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    10ba:	89 fa                	mov    %edi,%edx
    10bc:	8b 45 08             	mov    0x8(%ebp),%eax
    10bf:	e8 36 ff ff ff       	call   ffa <putc>
    10c4:	eb 05                	jmp    10cb <printf+0x30>
      }
    } else if(state == '%'){
    10c6:	83 fe 25             	cmp    $0x25,%esi
    10c9:	74 25                	je     10f0 <printf+0x55>
  for(i = 0; fmt[i]; i++){
    10cb:	83 c3 01             	add    $0x1,%ebx
    10ce:	8b 45 0c             	mov    0xc(%ebp),%eax
    10d1:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
    10d5:	84 c0                	test   %al,%al
    10d7:	0f 84 23 01 00 00    	je     1200 <printf+0x165>
    c = fmt[i] & 0xff;
    10dd:	0f be f8             	movsbl %al,%edi
    10e0:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
    10e3:	85 f6                	test   %esi,%esi
    10e5:	75 df                	jne    10c6 <printf+0x2b>
      if(c == '%'){
    10e7:	83 f8 25             	cmp    $0x25,%eax
    10ea:	75 ce                	jne    10ba <printf+0x1f>
        state = '%';
    10ec:	89 c6                	mov    %eax,%esi
    10ee:	eb db                	jmp    10cb <printf+0x30>
      if(c == 'd'){
    10f0:	83 f8 64             	cmp    $0x64,%eax
    10f3:	74 49                	je     113e <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    10f5:	83 f8 78             	cmp    $0x78,%eax
    10f8:	0f 94 c1             	sete   %cl
    10fb:	83 f8 70             	cmp    $0x70,%eax
    10fe:	0f 94 c2             	sete   %dl
    1101:	08 d1                	or     %dl,%cl
    1103:	75 63                	jne    1168 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1105:	83 f8 73             	cmp    $0x73,%eax
    1108:	0f 84 84 00 00 00    	je     1192 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    110e:	83 f8 63             	cmp    $0x63,%eax
    1111:	0f 84 b7 00 00 00    	je     11ce <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1117:	83 f8 25             	cmp    $0x25,%eax
    111a:	0f 84 cc 00 00 00    	je     11ec <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1120:	ba 25 00 00 00       	mov    $0x25,%edx
    1125:	8b 45 08             	mov    0x8(%ebp),%eax
    1128:	e8 cd fe ff ff       	call   ffa <putc>
        putc(fd, c);
    112d:	89 fa                	mov    %edi,%edx
    112f:	8b 45 08             	mov    0x8(%ebp),%eax
    1132:	e8 c3 fe ff ff       	call   ffa <putc>
      }
      state = 0;
    1137:	be 00 00 00 00       	mov    $0x0,%esi
    113c:	eb 8d                	jmp    10cb <printf+0x30>
        printint(fd, *ap, 10, 1);
    113e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    1141:	8b 17                	mov    (%edi),%edx
    1143:	83 ec 0c             	sub    $0xc,%esp
    1146:	6a 01                	push   $0x1
    1148:	b9 0a 00 00 00       	mov    $0xa,%ecx
    114d:	8b 45 08             	mov    0x8(%ebp),%eax
    1150:	e8 bf fe ff ff       	call   1014 <printint>
        ap++;
    1155:	83 c7 04             	add    $0x4,%edi
    1158:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    115b:	83 c4 10             	add    $0x10,%esp
      state = 0;
    115e:	be 00 00 00 00       	mov    $0x0,%esi
    1163:	e9 63 ff ff ff       	jmp    10cb <printf+0x30>
        printint(fd, *ap, 16, 0);
    1168:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    116b:	8b 17                	mov    (%edi),%edx
    116d:	83 ec 0c             	sub    $0xc,%esp
    1170:	6a 00                	push   $0x0
    1172:	b9 10 00 00 00       	mov    $0x10,%ecx
    1177:	8b 45 08             	mov    0x8(%ebp),%eax
    117a:	e8 95 fe ff ff       	call   1014 <printint>
        ap++;
    117f:	83 c7 04             	add    $0x4,%edi
    1182:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    1185:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1188:	be 00 00 00 00       	mov    $0x0,%esi
    118d:	e9 39 ff ff ff       	jmp    10cb <printf+0x30>
        s = (char*)*ap;
    1192:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1195:	8b 30                	mov    (%eax),%esi
        ap++;
    1197:	83 c0 04             	add    $0x4,%eax
    119a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
    119d:	85 f6                	test   %esi,%esi
    119f:	75 28                	jne    11c9 <printf+0x12e>
          s = "(null)";
    11a1:	be 8c 14 00 00       	mov    $0x148c,%esi
    11a6:	8b 7d 08             	mov    0x8(%ebp),%edi
    11a9:	eb 0d                	jmp    11b8 <printf+0x11d>
          putc(fd, *s);
    11ab:	0f be d2             	movsbl %dl,%edx
    11ae:	89 f8                	mov    %edi,%eax
    11b0:	e8 45 fe ff ff       	call   ffa <putc>
          s++;
    11b5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
    11b8:	0f b6 16             	movzbl (%esi),%edx
    11bb:	84 d2                	test   %dl,%dl
    11bd:	75 ec                	jne    11ab <printf+0x110>
      state = 0;
    11bf:	be 00 00 00 00       	mov    $0x0,%esi
    11c4:	e9 02 ff ff ff       	jmp    10cb <printf+0x30>
    11c9:	8b 7d 08             	mov    0x8(%ebp),%edi
    11cc:	eb ea                	jmp    11b8 <printf+0x11d>
        putc(fd, *ap);
    11ce:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    11d1:	0f be 17             	movsbl (%edi),%edx
    11d4:	8b 45 08             	mov    0x8(%ebp),%eax
    11d7:	e8 1e fe ff ff       	call   ffa <putc>
        ap++;
    11dc:	83 c7 04             	add    $0x4,%edi
    11df:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
    11e2:	be 00 00 00 00       	mov    $0x0,%esi
    11e7:	e9 df fe ff ff       	jmp    10cb <printf+0x30>
        putc(fd, c);
    11ec:	89 fa                	mov    %edi,%edx
    11ee:	8b 45 08             	mov    0x8(%ebp),%eax
    11f1:	e8 04 fe ff ff       	call   ffa <putc>
      state = 0;
    11f6:	be 00 00 00 00       	mov    $0x0,%esi
    11fb:	e9 cb fe ff ff       	jmp    10cb <printf+0x30>
    }
  }
}
    1200:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1203:	5b                   	pop    %ebx
    1204:	5e                   	pop    %esi
    1205:	5f                   	pop    %edi
    1206:	5d                   	pop    %ebp
    1207:	c3                   	ret    

00001208 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1208:	f3 0f 1e fb          	endbr32 
    120c:	55                   	push   %ebp
    120d:	89 e5                	mov    %esp,%ebp
    120f:	57                   	push   %edi
    1210:	56                   	push   %esi
    1211:	53                   	push   %ebx
    1212:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1215:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1218:	a1 84 1b 00 00       	mov    0x1b84,%eax
    121d:	eb 02                	jmp    1221 <free+0x19>
    121f:	89 d0                	mov    %edx,%eax
    1221:	39 c8                	cmp    %ecx,%eax
    1223:	73 04                	jae    1229 <free+0x21>
    1225:	39 08                	cmp    %ecx,(%eax)
    1227:	77 12                	ja     123b <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1229:	8b 10                	mov    (%eax),%edx
    122b:	39 c2                	cmp    %eax,%edx
    122d:	77 f0                	ja     121f <free+0x17>
    122f:	39 c8                	cmp    %ecx,%eax
    1231:	72 08                	jb     123b <free+0x33>
    1233:	39 ca                	cmp    %ecx,%edx
    1235:	77 04                	ja     123b <free+0x33>
    1237:	89 d0                	mov    %edx,%eax
    1239:	eb e6                	jmp    1221 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
    123b:	8b 73 fc             	mov    -0x4(%ebx),%esi
    123e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1241:	8b 10                	mov    (%eax),%edx
    1243:	39 d7                	cmp    %edx,%edi
    1245:	74 19                	je     1260 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1247:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    124a:	8b 50 04             	mov    0x4(%eax),%edx
    124d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1250:	39 ce                	cmp    %ecx,%esi
    1252:	74 1b                	je     126f <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1254:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1256:	a3 84 1b 00 00       	mov    %eax,0x1b84
}
    125b:	5b                   	pop    %ebx
    125c:	5e                   	pop    %esi
    125d:	5f                   	pop    %edi
    125e:	5d                   	pop    %ebp
    125f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    1260:	03 72 04             	add    0x4(%edx),%esi
    1263:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1266:	8b 10                	mov    (%eax),%edx
    1268:	8b 12                	mov    (%edx),%edx
    126a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    126d:	eb db                	jmp    124a <free+0x42>
    p->s.size += bp->s.size;
    126f:	03 53 fc             	add    -0x4(%ebx),%edx
    1272:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1275:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1278:	89 10                	mov    %edx,(%eax)
    127a:	eb da                	jmp    1256 <free+0x4e>

0000127c <morecore>:

static Header*
morecore(uint nu)
{
    127c:	55                   	push   %ebp
    127d:	89 e5                	mov    %esp,%ebp
    127f:	53                   	push   %ebx
    1280:	83 ec 04             	sub    $0x4,%esp
    1283:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    1285:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    128a:	77 05                	ja     1291 <morecore+0x15>
    nu = 4096;
    128c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    1291:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    1298:	83 ec 0c             	sub    $0xc,%esp
    129b:	50                   	push   %eax
    129c:	e8 01 fd ff ff       	call   fa2 <sbrk>
  if(p == (char*)-1)
    12a1:	83 c4 10             	add    $0x10,%esp
    12a4:	83 f8 ff             	cmp    $0xffffffff,%eax
    12a7:	74 1c                	je     12c5 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    12a9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    12ac:	83 c0 08             	add    $0x8,%eax
    12af:	83 ec 0c             	sub    $0xc,%esp
    12b2:	50                   	push   %eax
    12b3:	e8 50 ff ff ff       	call   1208 <free>
  return freep;
    12b8:	a1 84 1b 00 00       	mov    0x1b84,%eax
    12bd:	83 c4 10             	add    $0x10,%esp
}
    12c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    12c3:	c9                   	leave  
    12c4:	c3                   	ret    
    return 0;
    12c5:	b8 00 00 00 00       	mov    $0x0,%eax
    12ca:	eb f4                	jmp    12c0 <morecore+0x44>

000012cc <malloc>:

void*
malloc(uint nbytes)
{
    12cc:	f3 0f 1e fb          	endbr32 
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	53                   	push   %ebx
    12d4:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    12d7:	8b 45 08             	mov    0x8(%ebp),%eax
    12da:	8d 58 07             	lea    0x7(%eax),%ebx
    12dd:	c1 eb 03             	shr    $0x3,%ebx
    12e0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    12e3:	8b 0d 84 1b 00 00    	mov    0x1b84,%ecx
    12e9:	85 c9                	test   %ecx,%ecx
    12eb:	74 04                	je     12f1 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12ed:	8b 01                	mov    (%ecx),%eax
    12ef:	eb 4b                	jmp    133c <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
    12f1:	c7 05 84 1b 00 00 88 	movl   $0x1b88,0x1b84
    12f8:	1b 00 00 
    12fb:	c7 05 88 1b 00 00 88 	movl   $0x1b88,0x1b88
    1302:	1b 00 00 
    base.s.size = 0;
    1305:	c7 05 8c 1b 00 00 00 	movl   $0x0,0x1b8c
    130c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    130f:	b9 88 1b 00 00       	mov    $0x1b88,%ecx
    1314:	eb d7                	jmp    12ed <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1316:	74 1a                	je     1332 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1318:	29 da                	sub    %ebx,%edx
    131a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    131d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    1320:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    1323:	89 0d 84 1b 00 00    	mov    %ecx,0x1b84
      return (void*)(p + 1);
    1329:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    132c:	83 c4 04             	add    $0x4,%esp
    132f:	5b                   	pop    %ebx
    1330:	5d                   	pop    %ebp
    1331:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1332:	8b 10                	mov    (%eax),%edx
    1334:	89 11                	mov    %edx,(%ecx)
    1336:	eb eb                	jmp    1323 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1338:	89 c1                	mov    %eax,%ecx
    133a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    133c:	8b 50 04             	mov    0x4(%eax),%edx
    133f:	39 da                	cmp    %ebx,%edx
    1341:	73 d3                	jae    1316 <malloc+0x4a>
    if(p == freep)
    1343:	39 05 84 1b 00 00    	cmp    %eax,0x1b84
    1349:	75 ed                	jne    1338 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
    134b:	89 d8                	mov    %ebx,%eax
    134d:	e8 2a ff ff ff       	call   127c <morecore>
    1352:	85 c0                	test   %eax,%eax
    1354:	75 e2                	jne    1338 <malloc+0x6c>
    1356:	eb d4                	jmp    132c <malloc+0x60>
