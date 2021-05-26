
_p2-test:     file format elf32-i386


Disassembly of section .text:

00000000 <testinvalidarray>:
  free(table);
  return success;
}

static int
testinvalidarray(void){
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	56                   	push   %esi
       4:	53                   	push   %ebx
  struct uproc * table;
  int ret;

  table = malloc(sizeof(struct uproc));
       5:	83 ec 0c             	sub    $0xc,%esp
       8:	6a 5c                	push   $0x5c
       a:	e8 b5 10 00 00       	call   10c4 <malloc>
  if (!table) {
       f:	83 c4 10             	add    $0x10,%esp
      12:	85 c0                	test   %eax,%eax
      14:	74 2d                	je     43 <testinvalidarray+0x43>
      16:	89 c3                	mov    %eax,%ebx
    printf(2, "Error: malloc() call failed. %s at line %d\n", __FUNCTION__, __LINE__);
    exit();
  }
  ret = getprocs(1024, table);
      18:	83 ec 08             	sub    $0x8,%esp
      1b:	50                   	push   %eax
      1c:	68 00 04 00 00       	push   $0x400
      21:	e8 c4 0d 00 00       	call   dea <getprocs>
      26:	89 c6                	mov    %eax,%esi
  free(table);
      28:	89 1c 24             	mov    %ebx,(%esp)
      2b:	e8 d0 0f 00 00       	call   1000 <free>
  if(ret >= 0){
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 f6                	test   %esi,%esi
      35:	79 27                	jns    5e <testinvalidarray+0x5e>
    printf(2, "FAILED: called getprocs with max way larger than table and returned %d, not error\n", ret);
    return -1;
  }
  return 0;
      37:	b8 00 00 00 00       	mov    $0x0,%eax
}
      3c:	8d 65 f8             	lea    -0x8(%ebp),%esp
      3f:	5b                   	pop    %ebx
      40:	5e                   	pop    %esi
      41:	5d                   	pop    %ebp
      42:	c3                   	ret    
    printf(2, "Error: malloc() call failed. %s at line %d\n", __FUNCTION__, __LINE__);
      43:	68 06 01 00 00       	push   $0x106
      48:	68 b0 17 00 00       	push   $0x17b0
      4d:	68 50 11 00 00       	push   $0x1150
      52:	6a 02                	push   $0x2
      54:	e8 3a 0e 00 00       	call   e93 <printf>
    exit();
      59:	e8 b4 0c 00 00       	call   d12 <exit>
    printf(2, "FAILED: called getprocs with max way larger than table and returned %d, not error\n", ret);
      5e:	83 ec 04             	sub    $0x4,%esp
      61:	56                   	push   %esi
      62:	68 7c 11 00 00       	push   $0x117c
      67:	6a 02                	push   $0x2
      69:	e8 25 0e 00 00       	call   e93 <printf>
    return -1;
      6e:	83 c4 10             	add    $0x10,%esp
      71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      76:	eb c4                	jmp    3c <testinvalidarray+0x3c>

00000078 <testprocarray>:
testprocarray(int max, int expected_ret){
      78:	55                   	push   %ebp
      79:	89 e5                	mov    %esp,%ebp
      7b:	57                   	push   %edi
      7c:	56                   	push   %esi
      7d:	53                   	push   %ebx
      7e:	83 ec 18             	sub    $0x18,%esp
      81:	89 c6                	mov    %eax,%esi
      83:	89 d7                	mov    %edx,%edi
  table = malloc(sizeof(struct uproc) * max);  // bad code, assumes success
      85:	6b c0 5c             	imul   $0x5c,%eax,%eax
      88:	50                   	push   %eax
      89:	e8 36 10 00 00       	call   10c4 <malloc>
  if (!table) {
      8e:	83 c4 10             	add    $0x10,%esp
      91:	85 c0                	test   %eax,%eax
      93:	74 3c                	je     d1 <testprocarray+0x59>
      95:	89 c3                	mov    %eax,%ebx
  ret = getprocs(max, table);
      97:	83 ec 08             	sub    $0x8,%esp
      9a:	50                   	push   %eax
      9b:	56                   	push   %esi
      9c:	e8 49 0d 00 00       	call   dea <getprocs>
  if (ret != expected_ret){
      a1:	83 c4 10             	add    $0x10,%esp
      a4:	39 f8                	cmp    %edi,%eax
      a6:	75 44                	jne    ec <testprocarray+0x74>
    printf(2, "getprocs() was asked for %d processes and returned %d. SUCCESS\n", max, expected_ret);
      a8:	57                   	push   %edi
      a9:	56                   	push   %esi
      aa:	68 00 12 00 00       	push   $0x1200
      af:	6a 02                	push   $0x2
      b1:	e8 dd 0d 00 00       	call   e93 <printf>
      b6:	83 c4 10             	add    $0x10,%esp
  int ret, success = 0;
      b9:	be 00 00 00 00       	mov    $0x0,%esi
  free(table);
      be:	83 ec 0c             	sub    $0xc,%esp
      c1:	53                   	push   %ebx
      c2:	e8 39 0f 00 00       	call   1000 <free>
}
      c7:	89 f0                	mov    %esi,%eax
      c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
      cc:	5b                   	pop    %ebx
      cd:	5e                   	pop    %esi
      ce:	5f                   	pop    %edi
      cf:	5d                   	pop    %ebp
      d0:	c3                   	ret    
    printf(2, "Error: malloc() call failed. %s at line %d\n", __FUNCTION__, __LINE__);
      d1:	68 f0 00 00 00       	push   $0xf0
      d6:	68 a0 17 00 00       	push   $0x17a0
      db:	68 50 11 00 00       	push   $0x1150
      e0:	6a 02                	push   $0x2
      e2:	e8 ac 0d 00 00       	call   e93 <printf>
    exit();
      e7:	e8 26 0c 00 00       	call   d12 <exit>
    printf(2, "FAILED: getprocs(%d) returned %d, expected %d\n", max, ret, expected_ret);
      ec:	83 ec 0c             	sub    $0xc,%esp
      ef:	57                   	push   %edi
      f0:	50                   	push   %eax
      f1:	56                   	push   %esi
      f2:	68 d0 11 00 00       	push   $0x11d0
      f7:	6a 02                	push   $0x2
      f9:	e8 95 0d 00 00       	call   e93 <printf>
    success = -1;
      fe:	83 c4 20             	add    $0x20,%esp
     101:	be ff ff ff ff       	mov    $0xffffffff,%esi
     106:	eb b6                	jmp    be <testprocarray+0x46>

00000108 <testgetprocs>:

static void
testgetprocs(){
     108:	55                   	push   %ebp
     109:	89 e5                	mov    %esp,%ebp
     10b:	53                   	push   %ebx
     10c:	83 ec 0c             	sub    $0xc,%esp
  int ret, success;

  printf(1, "\n----------\nRunning GetProcs Test\n----------\n");
     10f:	68 40 12 00 00       	push   $0x1240
     114:	6a 01                	push   $0x1
     116:	e8 78 0d 00 00       	call   e93 <printf>
  printf(1, "Filling the proc[] array with dummy processes\n");
     11b:	83 c4 08             	add    $0x8,%esp
     11e:	68 70 12 00 00       	push   $0x1270
     123:	6a 01                	push   $0x1
     125:	e8 69 0d 00 00       	call   e93 <printf>
  // Fork until no space left in ptable
  ret = fork();
     12a:	e8 db 0b 00 00       	call   d0a <fork>
  if (ret == 0){
     12f:	83 c4 10             	add    $0x10,%esp
     132:	85 c0                	test   %eax,%eax
     134:	75 7b                	jne    1b1 <testgetprocs+0xa9>
    while((ret = fork()) == 0);
     136:	e8 cf 0b 00 00       	call   d0a <fork>
     13b:	85 c0                	test   %eax,%eax
     13d:	74 f7                	je     136 <testgetprocs+0x2e>
    if(ret > 0){
     13f:	7e 0a                	jle    14b <testgetprocs+0x43>
      wait();
     141:	e8 d4 0b 00 00       	call   d1a <wait>
      exit();
     146:	e8 c7 0b 00 00       	call   d12 <exit>
    }
    // Only return left is -1, which is no space left in ptable
    success  = testinvalidarray();
     14b:	e8 b0 fe ff ff       	call   0 <testinvalidarray>
     150:	89 c3                	mov    %eax,%ebx
    success |= testprocarray( 1,  1);
     152:	ba 01 00 00 00       	mov    $0x1,%edx
     157:	b8 01 00 00 00       	mov    $0x1,%eax
     15c:	e8 17 ff ff ff       	call   78 <testprocarray>
     161:	09 c3                	or     %eax,%ebx
    success |= testprocarray(16, 16);
     163:	ba 10 00 00 00       	mov    $0x10,%edx
     168:	b8 10 00 00 00       	mov    $0x10,%eax
     16d:	e8 06 ff ff ff       	call   78 <testprocarray>
     172:	09 c3                	or     %eax,%ebx
    success |= testprocarray(64, 64);
     174:	ba 40 00 00 00       	mov    $0x40,%edx
     179:	b8 40 00 00 00       	mov    $0x40,%eax
     17e:	e8 f5 fe ff ff       	call   78 <testprocarray>
     183:	09 c3                	or     %eax,%ebx
    success |= testprocarray(72, 64);
     185:	ba 40 00 00 00       	mov    $0x40,%edx
     18a:	b8 48 00 00 00       	mov    $0x48,%eax
     18f:	e8 e4 fe ff ff       	call   78 <testprocarray>
    if (success == 0)
     194:	09 c3                	or     %eax,%ebx
     196:	74 05                	je     19d <testgetprocs+0x95>
      printf(1, "** All Tests Passed **\n");
    exit();
     198:	e8 75 0b 00 00       	call   d12 <exit>
      printf(1, "** All Tests Passed **\n");
     19d:	83 ec 08             	sub    $0x8,%esp
     1a0:	68 b4 16 00 00       	push   $0x16b4
     1a5:	6a 01                	push   $0x1
     1a7:	e8 e7 0c 00 00       	call   e93 <printf>
     1ac:	83 c4 10             	add    $0x10,%esp
     1af:	eb e7                	jmp    198 <testgetprocs+0x90>
  }
  wait();
     1b1:	e8 64 0b 00 00       	call   d1a <wait>
}
     1b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     1b9:	c9                   	leave  
     1ba:	c3                   	ret    

000001bb <getcputime>:
getcputime(char * name, struct uproc * table){
     1bb:	55                   	push   %ebp
     1bc:	89 e5                	mov    %esp,%ebp
     1be:	57                   	push   %edi
     1bf:	56                   	push   %esi
     1c0:	53                   	push   %ebx
     1c1:	83 ec 24             	sub    $0x24,%esp
     1c4:	89 c7                	mov    %eax,%edi
     1c6:	89 55 e0             	mov    %edx,-0x20(%ebp)
  size = getprocs(64, table);
     1c9:	52                   	push   %edx
     1ca:	6a 40                	push   $0x40
     1cc:	e8 19 0c 00 00       	call   dea <getprocs>
     1d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int i = 0; i < size; ++i){
     1d4:	83 c4 10             	add    $0x10,%esp
     1d7:	be 00 00 00 00       	mov    $0x0,%esi
     1dc:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
     1df:	7d 1f                	jge    200 <getcputime+0x45>
    if(strcmp(table[i].name, name) == 0){
     1e1:	6b de 5c             	imul   $0x5c,%esi,%ebx
     1e4:	03 5d e0             	add    -0x20(%ebp),%ebx
     1e7:	8d 43 3c             	lea    0x3c(%ebx),%eax
     1ea:	83 ec 08             	sub    $0x8,%esp
     1ed:	57                   	push   %edi
     1ee:	50                   	push   %eax
     1ef:	e8 b2 08 00 00       	call   aa6 <strcmp>
     1f4:	83 c4 10             	add    $0x10,%esp
     1f7:	85 c0                	test   %eax,%eax
     1f9:	74 0a                	je     205 <getcputime+0x4a>
  for(int i = 0; i < size; ++i){
     1fb:	83 c6 01             	add    $0x1,%esi
     1fe:	eb dc                	jmp    1dc <getcputime+0x21>
  struct uproc *p = 0;
     200:	bb 00 00 00 00       	mov    $0x0,%ebx
  if(p == 0){
     205:	85 db                	test   %ebx,%ebx
     207:	74 0b                	je     214 <getcputime+0x59>
    return p->CPU_total_ticks;
     209:	8b 43 14             	mov    0x14(%ebx),%eax
}
     20c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     20f:	5b                   	pop    %ebx
     210:	5e                   	pop    %esi
     211:	5f                   	pop    %edi
     212:	5d                   	pop    %ebp
     213:	c3                   	ret    
    printf(2, "FAILED: Test program \"%s\" not found in table returned by getprocs\n", name);
     214:	83 ec 04             	sub    $0x4,%esp
     217:	57                   	push   %edi
     218:	68 a0 12 00 00       	push   $0x12a0
     21d:	6a 02                	push   $0x2
     21f:	e8 6f 0c 00 00       	call   e93 <printf>
    return -1;
     224:	83 c4 10             	add    $0x10,%esp
     227:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     22c:	eb de                	jmp    20c <getcputime+0x51>

0000022e <testcputime>:
testcputime(char * name){
     22e:	55                   	push   %ebp
     22f:	89 e5                	mov    %esp,%ebp
     231:	57                   	push   %edi
     232:	56                   	push   %esi
     233:	53                   	push   %ebx
     234:	83 ec 24             	sub    $0x24,%esp
     237:	89 c7                	mov    %eax,%edi
  printf(1, "\n----------\nRunning CPU Time Test\n----------\n");
     239:	68 e4 12 00 00       	push   $0x12e4
     23e:	6a 01                	push   $0x1
     240:	e8 4e 0c 00 00       	call   e93 <printf>
  table = malloc(sizeof(struct uproc) * 64);
     245:	c7 04 24 00 17 00 00 	movl   $0x1700,(%esp)
     24c:	e8 73 0e 00 00       	call   10c4 <malloc>
     251:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if (!table) {
     254:	83 c4 10             	add    $0x10,%esp
     257:	85 c0                	test   %eax,%eax
     259:	74 32                	je     28d <testcputime+0x5f>
  printf(1, "This will take a couple seconds\n");
     25b:	83 ec 08             	sub    $0x8,%esp
     25e:	68 14 13 00 00       	push   $0x1314
     263:	6a 01                	push   $0x1
     265:	e8 29 0c 00 00       	call   e93 <printf>
  time1 = getcputime(name, table);
     26a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     26d:	89 f8                	mov    %edi,%eax
     26f:	e8 47 ff ff ff       	call   1bb <getcputime>
     274:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(i = 0, num = 0; i < 1000000; ++i){
     277:	83 c4 10             	add    $0x10,%esp
     27a:	bb 00 00 00 00       	mov    $0x0,%ebx
     27f:	be 00 00 00 00       	mov    $0x0,%esi
  int success = 0;
     284:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  for(i = 0, num = 0; i < 1000000; ++i){
     28b:	eb 37                	jmp    2c4 <testcputime+0x96>
    printf(2, "Error: malloc() call failed. %s at line %d\n", __FUNCTION__, __LINE__);
     28d:	68 c1 00 00 00       	push   $0xc1
     292:	68 c4 17 00 00       	push   $0x17c4
     297:	68 50 11 00 00       	push   $0x1150
     29c:	6a 02                	push   $0x2
     29e:	e8 f0 0b 00 00       	call   e93 <printf>
    exit();
     2a3:	e8 6a 0a 00 00       	call   d12 <exit>
        printf(2, "FAILED: CPU_total_ticks changed by 100+ milliseconds while process was asleep\n");
     2a8:	83 ec 08             	sub    $0x8,%esp
     2ab:	68 38 13 00 00       	push   $0x1338
     2b0:	6a 02                	push   $0x2
     2b2:	e8 dc 0b 00 00       	call   e93 <printf>
     2b7:	83 c4 10             	add    $0x10,%esp
        success = -1;
     2ba:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%ebp)
  for(i = 0, num = 0; i < 1000000; ++i){
     2c1:	83 c6 01             	add    $0x1,%esi
     2c4:	81 fe 3f 42 0f 00    	cmp    $0xf423f,%esi
     2ca:	7f 51                	jg     31d <testcputime+0xef>
    ++num;
     2cc:	83 c3 01             	add    $0x1,%ebx
    if(num % 100000 == 0){
     2cf:	ba 89 b5 f8 14       	mov    $0x14f8b589,%edx
     2d4:	89 d8                	mov    %ebx,%eax
     2d6:	f7 ea                	imul   %edx
     2d8:	c1 fa 0d             	sar    $0xd,%edx
     2db:	89 d8                	mov    %ebx,%eax
     2dd:	c1 f8 1f             	sar    $0x1f,%eax
     2e0:	29 c2                	sub    %eax,%edx
     2e2:	69 d2 a0 86 01 00    	imul   $0x186a0,%edx,%edx
     2e8:	39 d3                	cmp    %edx,%ebx
     2ea:	75 d5                	jne    2c1 <testcputime+0x93>
      pre_sleep = getcputime(name, table);
     2ec:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     2ef:	89 f8                	mov    %edi,%eax
     2f1:	e8 c5 fe ff ff       	call   1bb <getcputime>
     2f6:	89 45 e0             	mov    %eax,-0x20(%ebp)
      sleep(200);
     2f9:	83 ec 0c             	sub    $0xc,%esp
     2fc:	68 c8 00 00 00       	push   $0xc8
     301:	e8 9c 0a 00 00       	call   da2 <sleep>
      post_sleep = getcputime(name, table);
     306:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     309:	89 f8                	mov    %edi,%eax
     30b:	e8 ab fe ff ff       	call   1bb <getcputime>
      if((post_sleep - pre_sleep) >= 100){
     310:	2b 45 e0             	sub    -0x20(%ebp),%eax
     313:	83 c4 10             	add    $0x10,%esp
     316:	83 f8 63             	cmp    $0x63,%eax
     319:	76 a6                	jbe    2c1 <testcputime+0x93>
     31b:	eb 8b                	jmp    2a8 <testcputime+0x7a>
  time2 = getcputime(name, table);
     31d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     320:	89 f8                	mov    %edi,%eax
     322:	e8 94 fe ff ff       	call   1bb <getcputime>
  if((time2 - time1) > 400){
     327:	2b 45 d8             	sub    -0x28(%ebp),%eax
     32a:	89 c3                	mov    %eax,%ebx
     32c:	3d 90 01 00 00       	cmp    $0x190,%eax
     331:	77 2c                	ja     35f <testcputime+0x131>
  printf(1, "T2 - T1 = %d milliseconds\n", (time2 - time1));
     333:	83 ec 04             	sub    $0x4,%esp
     336:	53                   	push   %ebx
     337:	68 cc 16 00 00       	push   $0x16cc
     33c:	6a 01                	push   $0x1
     33e:	e8 50 0b 00 00       	call   e93 <printf>
  free(table);
     343:	83 c4 04             	add    $0x4,%esp
     346:	ff 75 e4             	pushl  -0x1c(%ebp)
     349:	e8 b2 0c 00 00       	call   1000 <free>
  if(success == 0)
     34e:	83 c4 10             	add    $0x10,%esp
     351:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
     355:	74 24                	je     37b <testcputime+0x14d>
}
     357:	8d 65 f4             	lea    -0xc(%ebp),%esp
     35a:	5b                   	pop    %ebx
     35b:	5e                   	pop    %esi
     35c:	5f                   	pop    %edi
     35d:	5d                   	pop    %ebp
     35e:	c3                   	ret    
    printf(2, "ABNORMALLY HIGH: T2 - T1 = %d milliseconds.  Run test again\n", (time2 - time1));
     35f:	83 ec 04             	sub    $0x4,%esp
     362:	50                   	push   %eax
     363:	68 88 13 00 00       	push   $0x1388
     368:	6a 02                	push   $0x2
     36a:	e8 24 0b 00 00       	call   e93 <printf>
     36f:	83 c4 10             	add    $0x10,%esp
    success = -1;
     372:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%ebp)
     379:	eb b8                	jmp    333 <testcputime+0x105>
    printf(1, "** All Tests Passed! **\n");
     37b:	83 ec 08             	sub    $0x8,%esp
     37e:	68 e7 16 00 00       	push   $0x16e7
     383:	6a 01                	push   $0x1
     385:	e8 09 0b 00 00       	call   e93 <printf>
     38a:	83 c4 10             	add    $0x10,%esp
}
     38d:	eb c8                	jmp    357 <testcputime+0x129>

0000038f <testuid>:
testuid(uint new_val, uint expected_get_val, int expected_set_ret){
     38f:	55                   	push   %ebp
     390:	89 e5                	mov    %esp,%ebp
     392:	57                   	push   %edi
     393:	56                   	push   %esi
     394:	53                   	push   %ebx
     395:	83 ec 1c             	sub    $0x1c,%esp
     398:	89 c3                	mov    %eax,%ebx
     39a:	89 d7                	mov    %edx,%edi
     39c:	89 ce                	mov    %ecx,%esi
  pre_uid = getuid();
     39e:	e8 1f 0a 00 00       	call   dc2 <getuid>
     3a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  ret = setuid(new_val);
     3a6:	83 ec 0c             	sub    $0xc,%esp
     3a9:	53                   	push   %ebx
     3aa:	e8 2b 0a 00 00       	call   dda <setuid>
  if((ret < 0 && expected_set_ret >= 0) || (ret >= 0 && expected_set_ret < 0)){
     3af:	89 c1                	mov    %eax,%ecx
     3b1:	c1 e9 1f             	shr    $0x1f,%ecx
     3b4:	89 f2                	mov    %esi,%edx
     3b6:	c1 ea 1f             	shr    $0x1f,%edx
     3b9:	83 c4 10             	add    $0x10,%esp
     3bc:	38 d1                	cmp    %dl,%cl
     3be:	75 18                	jne    3d8 <testuid+0x49>
  int success = 0;
     3c0:	be 00 00 00 00       	mov    $0x0,%esi
  post_uid = getuid();
     3c5:	e8 f8 09 00 00       	call   dc2 <getuid>
  if(post_uid != expected_get_val){
     3ca:	39 f8                	cmp    %edi,%eax
     3cc:	75 26                	jne    3f4 <testuid+0x65>
}
     3ce:	89 f0                	mov    %esi,%eax
     3d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
     3d3:	5b                   	pop    %ebx
     3d4:	5e                   	pop    %esi
     3d5:	5f                   	pop    %edi
     3d6:	5d                   	pop    %ebp
     3d7:	c3                   	ret    
    printf(2, "FAILED: setuid(%d) returned %d, expected %d\n", new_val, ret, expected_set_ret);
     3d8:	83 ec 0c             	sub    $0xc,%esp
     3db:	56                   	push   %esi
     3dc:	50                   	push   %eax
     3dd:	53                   	push   %ebx
     3de:	68 c8 13 00 00       	push   $0x13c8
     3e3:	6a 02                	push   $0x2
     3e5:	e8 a9 0a 00 00       	call   e93 <printf>
     3ea:	83 c4 20             	add    $0x20,%esp
    success = -1;
     3ed:	be ff ff ff ff       	mov    $0xffffffff,%esi
     3f2:	eb d1                	jmp    3c5 <testuid+0x36>
    printf(2, "FAILED: UID was %d. After setuid(%d), getuid() returned %d, expected %d\n",
     3f4:	83 ec 08             	sub    $0x8,%esp
     3f7:	57                   	push   %edi
     3f8:	50                   	push   %eax
     3f9:	53                   	push   %ebx
     3fa:	ff 75 e4             	pushl  -0x1c(%ebp)
     3fd:	68 f8 13 00 00       	push   $0x13f8
     402:	6a 02                	push   $0x2
     404:	e8 8a 0a 00 00       	call   e93 <printf>
     409:	83 c4 20             	add    $0x20,%esp
    success = -1;
     40c:	be ff ff ff ff       	mov    $0xffffffff,%esi
  return success;
     411:	eb bb                	jmp    3ce <testuid+0x3f>

00000413 <testgid>:
testgid(uint new_val, uint expected_get_val, int expected_set_ret){
     413:	55                   	push   %ebp
     414:	89 e5                	mov    %esp,%ebp
     416:	57                   	push   %edi
     417:	56                   	push   %esi
     418:	53                   	push   %ebx
     419:	83 ec 1c             	sub    $0x1c,%esp
     41c:	89 c3                	mov    %eax,%ebx
     41e:	89 d7                	mov    %edx,%edi
     420:	89 ce                	mov    %ecx,%esi
  pre_gid = getgid();
     422:	e8 a3 09 00 00       	call   dca <getgid>
     427:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  ret = setgid(new_val);
     42a:	83 ec 0c             	sub    $0xc,%esp
     42d:	53                   	push   %ebx
     42e:	e8 af 09 00 00       	call   de2 <setgid>
  if((ret < 0 && expected_set_ret >= 0) || (ret >= 0 && expected_set_ret < 0)){
     433:	89 c1                	mov    %eax,%ecx
     435:	c1 e9 1f             	shr    $0x1f,%ecx
     438:	89 f2                	mov    %esi,%edx
     43a:	c1 ea 1f             	shr    $0x1f,%edx
     43d:	83 c4 10             	add    $0x10,%esp
     440:	38 d1                	cmp    %dl,%cl
     442:	75 18                	jne    45c <testgid+0x49>
  int success = 0;
     444:	be 00 00 00 00       	mov    $0x0,%esi
  post_gid = getgid();
     449:	e8 7c 09 00 00       	call   dca <getgid>
  if(post_gid != expected_get_val){
     44e:	39 f8                	cmp    %edi,%eax
     450:	75 26                	jne    478 <testgid+0x65>
}
     452:	89 f0                	mov    %esi,%eax
     454:	8d 65 f4             	lea    -0xc(%ebp),%esp
     457:	5b                   	pop    %ebx
     458:	5e                   	pop    %esi
     459:	5f                   	pop    %edi
     45a:	5d                   	pop    %ebp
     45b:	c3                   	ret    
    printf(2, "FAILED: setgid(%d) returned %d, expected %d\n", new_val, ret, expected_set_ret);
     45c:	83 ec 0c             	sub    $0xc,%esp
     45f:	56                   	push   %esi
     460:	50                   	push   %eax
     461:	53                   	push   %ebx
     462:	68 44 14 00 00       	push   $0x1444
     467:	6a 02                	push   $0x2
     469:	e8 25 0a 00 00       	call   e93 <printf>
     46e:	83 c4 20             	add    $0x20,%esp
    success = -1;
     471:	be ff ff ff ff       	mov    $0xffffffff,%esi
     476:	eb d1                	jmp    449 <testgid+0x36>
    printf(2, "FAILED: UID was %d. After setgid(%d), getgid() returned %d, expected %d\n",
     478:	83 ec 08             	sub    $0x8,%esp
     47b:	57                   	push   %edi
     47c:	50                   	push   %eax
     47d:	53                   	push   %ebx
     47e:	ff 75 e4             	pushl  -0x1c(%ebp)
     481:	68 74 14 00 00       	push   $0x1474
     486:	6a 02                	push   $0x2
     488:	e8 06 0a 00 00       	call   e93 <printf>
     48d:	83 c4 20             	add    $0x20,%esp
    success = -1;
     490:	be ff ff ff ff       	mov    $0xffffffff,%esi
  return success;
     495:	eb bb                	jmp    452 <testgid+0x3f>

00000497 <testuidgid>:
{
     497:	55                   	push   %ebp
     498:	89 e5                	mov    %esp,%ebp
     49a:	53                   	push   %ebx
     49b:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "\n----------\nRunning UID / GID Tests\n----------\n");
     49e:	68 c0 14 00 00       	push   $0x14c0
     4a3:	6a 01                	push   $0x1
     4a5:	e8 e9 09 00 00       	call   e93 <printf>
  uid = getuid();
     4aa:	e8 13 09 00 00       	call   dc2 <getuid>
  if(uid < 0 || uid > 32767){
     4af:	83 c4 10             	add    $0x10,%esp
     4b2:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
     4b7:	0f 87 3b 01 00 00    	ja     5f8 <testuidgid+0x161>
  int success = 0;
     4bd:	bb 00 00 00 00       	mov    $0x0,%ebx
  if (testuid(0, 0, 0))
     4c2:	b9 00 00 00 00       	mov    $0x0,%ecx
     4c7:	ba 00 00 00 00       	mov    $0x0,%edx
     4cc:	b8 00 00 00 00       	mov    $0x0,%eax
     4d1:	e8 b9 fe ff ff       	call   38f <testuid>
     4d6:	85 c0                	test   %eax,%eax
     4d8:	74 05                	je     4df <testuidgid+0x48>
    success = -1;
     4da:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if (testuid(5, 5, 0))
     4df:	b9 00 00 00 00       	mov    $0x0,%ecx
     4e4:	ba 05 00 00 00       	mov    $0x5,%edx
     4e9:	b8 05 00 00 00       	mov    $0x5,%eax
     4ee:	e8 9c fe ff ff       	call   38f <testuid>
     4f3:	85 c0                	test   %eax,%eax
     4f5:	74 05                	je     4fc <testuidgid+0x65>
    success = -1;
     4f7:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if (testuid(32767, 32767, 0))
     4fc:	b9 00 00 00 00       	mov    $0x0,%ecx
     501:	ba ff 7f 00 00       	mov    $0x7fff,%edx
     506:	b8 ff 7f 00 00       	mov    $0x7fff,%eax
     50b:	e8 7f fe ff ff       	call   38f <testuid>
     510:	85 c0                	test   %eax,%eax
     512:	74 05                	je     519 <testuidgid+0x82>
    success = -1;
     514:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if (testuid(32768, 32767, -1))
     519:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
     51e:	ba ff 7f 00 00       	mov    $0x7fff,%edx
     523:	b8 00 80 00 00       	mov    $0x8000,%eax
     528:	e8 62 fe ff ff       	call   38f <testuid>
     52d:	85 c0                	test   %eax,%eax
     52f:	74 05                	je     536 <testuidgid+0x9f>
    success = -1;
     531:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if (testuid(-1, 32767, -1))
     536:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
     53b:	ba ff 7f 00 00       	mov    $0x7fff,%edx
     540:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     545:	e8 45 fe ff ff       	call   38f <testuid>
     54a:	85 c0                	test   %eax,%eax
     54c:	74 05                	je     553 <testuidgid+0xbc>
    success = -1;
     54e:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  gid = getgid();
     553:	e8 72 08 00 00       	call   dca <getgid>
  if(gid < 0 || gid > 32767){
     558:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
     55d:	0f 87 b2 00 00 00    	ja     615 <testuidgid+0x17e>
  if (testgid(0, 0, 0))
     563:	b9 00 00 00 00       	mov    $0x0,%ecx
     568:	ba 00 00 00 00       	mov    $0x0,%edx
     56d:	b8 00 00 00 00       	mov    $0x0,%eax
     572:	e8 9c fe ff ff       	call   413 <testgid>
     577:	85 c0                	test   %eax,%eax
     579:	74 05                	je     580 <testuidgid+0xe9>
    success = -1;
     57b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if (testgid(5, 5, 0))
     580:	b9 00 00 00 00       	mov    $0x0,%ecx
     585:	ba 05 00 00 00       	mov    $0x5,%edx
     58a:	b8 05 00 00 00       	mov    $0x5,%eax
     58f:	e8 7f fe ff ff       	call   413 <testgid>
     594:	85 c0                	test   %eax,%eax
     596:	74 05                	je     59d <testuidgid+0x106>
    success = -1;
     598:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if (testgid(32767, 32767, 0))
     59d:	b9 00 00 00 00       	mov    $0x0,%ecx
     5a2:	ba ff 7f 00 00       	mov    $0x7fff,%edx
     5a7:	b8 ff 7f 00 00       	mov    $0x7fff,%eax
     5ac:	e8 62 fe ff ff       	call   413 <testgid>
     5b1:	85 c0                	test   %eax,%eax
     5b3:	74 05                	je     5ba <testuidgid+0x123>
    success = -1;
     5b5:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if (testgid(-1, 32767, -1))
     5ba:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
     5bf:	ba ff 7f 00 00       	mov    $0x7fff,%edx
     5c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     5c9:	e8 45 fe ff ff       	call   413 <testgid>
     5ce:	85 c0                	test   %eax,%eax
     5d0:	74 05                	je     5d7 <testuidgid+0x140>
    success = -1;
     5d2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if (testgid(32768, 32767, -1))
     5d7:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
     5dc:	ba ff 7f 00 00       	mov    $0x7fff,%edx
     5e1:	b8 00 80 00 00       	mov    $0x8000,%eax
     5e6:	e8 28 fe ff ff       	call   413 <testgid>
     5eb:	85 c0                	test   %eax,%eax
     5ed:	75 04                	jne    5f3 <testuidgid+0x15c>
  if (success == 0)
     5ef:	85 db                	test   %ebx,%ebx
     5f1:	74 3f                	je     632 <testuidgid+0x19b>
}
     5f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     5f6:	c9                   	leave  
     5f7:	c3                   	ret    
    printf(1, "FAILED: Default UID %d, out of range\n", uid);
     5f8:	83 ec 04             	sub    $0x4,%esp
     5fb:	50                   	push   %eax
     5fc:	68 f0 14 00 00       	push   $0x14f0
     601:	6a 01                	push   $0x1
     603:	e8 8b 08 00 00       	call   e93 <printf>
     608:	83 c4 10             	add    $0x10,%esp
    success = -1;
     60b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
     610:	e9 ad fe ff ff       	jmp    4c2 <testuidgid+0x2b>
    printf(1, "FAILED: Default GID %d, out of range\n", gid);
     615:	83 ec 04             	sub    $0x4,%esp
     618:	50                   	push   %eax
     619:	68 18 15 00 00       	push   $0x1518
     61e:	6a 01                	push   $0x1
     620:	e8 6e 08 00 00       	call   e93 <printf>
     625:	83 c4 10             	add    $0x10,%esp
    success = -1;
     628:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
     62d:	e9 31 ff ff ff       	jmp    563 <testuidgid+0xcc>
    printf(1, "** All tests passed! **\n");
     632:	83 ec 08             	sub    $0x8,%esp
     635:	68 00 17 00 00       	push   $0x1700
     63a:	6a 01                	push   $0x1
     63c:	e8 52 08 00 00       	call   e93 <printf>
     641:	83 c4 10             	add    $0x10,%esp
}
     644:	eb ad                	jmp    5f3 <testuidgid+0x15c>

00000646 <testuidgidinheritance>:
testuidgidinheritance(void){
     646:	55                   	push   %ebp
     647:	89 e5                	mov    %esp,%ebp
     649:	53                   	push   %ebx
     64a:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "\n----------\nRunning UID / GID Inheritance Test\n----------\n");
     64d:	68 40 15 00 00       	push   $0x1540
     652:	6a 01                	push   $0x1
     654:	e8 3a 08 00 00       	call   e93 <printf>
  if (testuid(12345, 12345, 0))
     659:	b9 00 00 00 00       	mov    $0x0,%ecx
     65e:	ba 39 30 00 00       	mov    $0x3039,%edx
     663:	b8 39 30 00 00       	mov    $0x3039,%eax
     668:	e8 22 fd ff ff       	call   38f <testuid>
     66d:	89 c3                	mov    %eax,%ebx
     66f:	83 c4 10             	add    $0x10,%esp
     672:	85 c0                	test   %eax,%eax
     674:	74 05                	je     67b <testuidgidinheritance+0x35>
    success = -1;
     676:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if (testgid(12345, 12345, 0))
     67b:	b9 00 00 00 00       	mov    $0x0,%ecx
     680:	ba 39 30 00 00       	mov    $0x3039,%edx
     685:	b8 39 30 00 00       	mov    $0x3039,%eax
     68a:	e8 84 fd ff ff       	call   413 <testgid>
     68f:	85 c0                	test   %eax,%eax
     691:	75 04                	jne    697 <testuidgidinheritance+0x51>
  if(success != 0)
     693:	85 db                	test   %ebx,%ebx
     695:	74 05                	je     69c <testuidgidinheritance+0x56>
}
     697:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     69a:	c9                   	leave  
     69b:	c3                   	ret    
  ret = fork();
     69c:	e8 69 06 00 00       	call   d0a <fork>
  if(ret == 0){
     6a1:	85 c0                	test   %eax,%eax
     6a3:	74 07                	je     6ac <testuidgidinheritance+0x66>
    wait();
     6a5:	e8 70 06 00 00       	call   d1a <wait>
     6aa:	eb eb                	jmp    697 <testuidgidinheritance+0x51>
    uid = getuid();
     6ac:	e8 11 07 00 00       	call   dc2 <getuid>
     6b1:	89 c3                	mov    %eax,%ebx
    gid = getgid();
     6b3:	e8 12 07 00 00       	call   dca <getgid>
    if(uid != 12345){
     6b8:	81 fb 39 30 00 00    	cmp    $0x3039,%ebx
     6be:	75 1c                	jne    6dc <testuidgidinheritance+0x96>
    else if(gid != 12345){
     6c0:	3d 39 30 00 00       	cmp    $0x3039,%eax
     6c5:	74 2d                	je     6f4 <testuidgidinheritance+0xae>
      printf(2, "FAILED: Parent GID is 12345, child GID is %d\n", gid);
     6c7:	83 ec 04             	sub    $0x4,%esp
     6ca:	50                   	push   %eax
     6cb:	68 ac 15 00 00       	push   $0x15ac
     6d0:	6a 02                	push   $0x2
     6d2:	e8 bc 07 00 00       	call   e93 <printf>
     6d7:	83 c4 10             	add    $0x10,%esp
     6da:	eb 13                	jmp    6ef <testuidgidinheritance+0xa9>
      printf(2, "FAILED: Parent UID is 12345, child UID is %d\n", uid);
     6dc:	83 ec 04             	sub    $0x4,%esp
     6df:	53                   	push   %ebx
     6e0:	68 7c 15 00 00       	push   $0x157c
     6e5:	6a 02                	push   $0x2
     6e7:	e8 a7 07 00 00       	call   e93 <printf>
     6ec:	83 c4 10             	add    $0x10,%esp
    exit();
     6ef:	e8 1e 06 00 00       	call   d12 <exit>
      printf(1, "** Test Passed! **\n");
     6f4:	83 ec 08             	sub    $0x8,%esp
     6f7:	68 19 17 00 00       	push   $0x1719
     6fc:	6a 01                	push   $0x1
     6fe:	e8 90 07 00 00       	call   e93 <printf>
     703:	83 c4 10             	add    $0x10,%esp
     706:	eb e7                	jmp    6ef <testuidgidinheritance+0xa9>

00000708 <testppid>:
testppid(void){
     708:	55                   	push   %ebp
     709:	89 e5                	mov    %esp,%ebp
     70b:	53                   	push   %ebx
     70c:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "\n----------\nRunning PPID Test\n----------\n");
     70f:	68 dc 15 00 00       	push   $0x15dc
     714:	6a 01                	push   $0x1
     716:	e8 78 07 00 00       	call   e93 <printf>
  pid = getpid();
     71b:	e8 72 06 00 00       	call   d92 <getpid>
     720:	89 c3                	mov    %eax,%ebx
  ret = fork();
     722:	e8 e3 05 00 00       	call   d0a <fork>
  if(ret == 0){
     727:	83 c4 10             	add    $0x10,%esp
     72a:	85 c0                	test   %eax,%eax
     72c:	74 0a                	je     738 <testppid+0x30>
    wait();
     72e:	e8 e7 05 00 00       	call   d1a <wait>
}
     733:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     736:	c9                   	leave  
     737:	c3                   	ret    
    ppid = getppid();
     738:	e8 95 06 00 00       	call   dd2 <getppid>
    if(ppid != pid)
     73d:	39 c3                	cmp    %eax,%ebx
     73f:	74 16                	je     757 <testppid+0x4f>
      printf(2, "FAILED: Parent PID is %d, Child's PPID is %d\n", pid, ppid);
     741:	50                   	push   %eax
     742:	53                   	push   %ebx
     743:	68 08 16 00 00       	push   $0x1608
     748:	6a 02                	push   $0x2
     74a:	e8 44 07 00 00       	call   e93 <printf>
     74f:	83 c4 10             	add    $0x10,%esp
    exit();
     752:	e8 bb 05 00 00       	call   d12 <exit>
      printf(1, "** Test passed! **\n");
     757:	83 ec 08             	sub    $0x8,%esp
     75a:	68 2d 17 00 00       	push   $0x172d
     75f:	6a 01                	push   $0x1
     761:	e8 2d 07 00 00       	call   e93 <printf>
     766:	83 c4 10             	add    $0x10,%esp
     769:	eb e7                	jmp    752 <testppid+0x4a>

0000076b <testtimewitharg>:
#endif

#ifdef TIME_TEST
// Forks a process and execs with time + args to see how it handles no args, invalid args, mulitple args
void
testtimewitharg(char **arg){
     76b:	f3 0f 1e fb          	endbr32 
     76f:	55                   	push   %ebp
     770:	89 e5                	mov    %esp,%ebp
     772:	83 ec 08             	sub    $0x8,%esp
  int ret;

  ret = fork();
     775:	e8 90 05 00 00       	call   d0a <fork>
  if (ret == 0){
     77a:	85 c0                	test   %eax,%eax
     77c:	74 0c                	je     78a <testtimewitharg+0x1f>
    exec(arg[0], arg);
    printf(2, "FAILED: exec failed to execute %s\n", arg[0]);
    exit();
  }
  else if(ret == -1){
     77e:	83 f8 ff             	cmp    $0xffffffff,%eax
     781:	74 30                	je     7b3 <testtimewitharg+0x48>
    printf(2, "FAILED: fork failed\n");
  }
  else
    wait();
     783:	e8 92 05 00 00       	call   d1a <wait>
}
     788:	c9                   	leave  
     789:	c3                   	ret    
    exec(arg[0], arg);
     78a:	83 ec 08             	sub    $0x8,%esp
     78d:	ff 75 08             	pushl  0x8(%ebp)
     790:	8b 45 08             	mov    0x8(%ebp),%eax
     793:	ff 30                	pushl  (%eax)
     795:	e8 b0 05 00 00       	call   d4a <exec>
    printf(2, "FAILED: exec failed to execute %s\n", arg[0]);
     79a:	83 c4 0c             	add    $0xc,%esp
     79d:	8b 45 08             	mov    0x8(%ebp),%eax
     7a0:	ff 30                	pushl  (%eax)
     7a2:	68 38 16 00 00       	push   $0x1638
     7a7:	6a 02                	push   $0x2
     7a9:	e8 e5 06 00 00       	call   e93 <printf>
    exit();
     7ae:	e8 5f 05 00 00       	call   d12 <exit>
    printf(2, "FAILED: fork failed\n");
     7b3:	83 ec 08             	sub    $0x8,%esp
     7b6:	68 41 17 00 00       	push   $0x1741
     7bb:	6a 02                	push   $0x2
     7bd:	e8 d1 06 00 00       	call   e93 <printf>
     7c2:	83 c4 10             	add    $0x10,%esp
     7c5:	eb c1                	jmp    788 <testtimewitharg+0x1d>

000007c7 <testtime>:
void
testtime(void){
     7c7:	f3 0f 1e fb          	endbr32 
     7cb:	55                   	push   %ebp
     7cc:	89 e5                	mov    %esp,%ebp
     7ce:	57                   	push   %edi
     7cf:	56                   	push   %esi
     7d0:	53                   	push   %ebx
     7d1:	83 ec 28             	sub    $0x28,%esp
  char **arg1 = malloc(sizeof(char *));
     7d4:	6a 04                	push   $0x4
     7d6:	e8 e9 08 00 00       	call   10c4 <malloc>
     7db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char **arg2 = malloc(sizeof(char *)*2);
     7de:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     7e5:	e8 da 08 00 00       	call   10c4 <malloc>
     7ea:	89 c7                	mov    %eax,%edi
  char **arg3 = malloc(sizeof(char *)*2);
     7ec:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     7f3:	e8 cc 08 00 00       	call   10c4 <malloc>
     7f8:	89 c6                	mov    %eax,%esi
  char **arg4 = malloc(sizeof(char *)*4);
     7fa:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
     801:	e8 be 08 00 00       	call   10c4 <malloc>
     806:	89 c3                	mov    %eax,%ebx

  // no argument
  arg1[0] = malloc(sizeof(char) * 5);
     808:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     80f:	e8 b0 08 00 00       	call   10c4 <malloc>
     814:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     817:	89 02                	mov    %eax,(%edx)
  strcpy(arg1[0], "time");
     819:	83 c4 08             	add    $0x8,%esp
     81c:	68 56 17 00 00       	push   $0x1756
     821:	50                   	push   %eax
     822:	e8 55 02 00 00       	call   a7c <strcpy>

  // single arg (fails)
  arg2[0] = malloc(sizeof(char) * 5);
     827:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     82e:	e8 91 08 00 00       	call   10c4 <malloc>
     833:	89 07                	mov    %eax,(%edi)
  strcpy(arg2[0], "time");
     835:	83 c4 08             	add    $0x8,%esp
     838:	68 56 17 00 00       	push   $0x1756
     83d:	50                   	push   %eax
     83e:	e8 39 02 00 00       	call   a7c <strcpy>
  arg2[1] = malloc(sizeof(char) * 4);
     843:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     84a:	e8 75 08 00 00       	call   10c4 <malloc>
     84f:	89 47 04             	mov    %eax,0x4(%edi)
  strcpy(arg2[1], "abc");
     852:	83 c4 08             	add    $0x8,%esp
     855:	68 5b 17 00 00       	push   $0x175b
     85a:	50                   	push   %eax
     85b:	e8 1c 02 00 00       	call   a7c <strcpy>

  // single arg (succeeds)
  arg3[0] = malloc(sizeof(char) * 5);
     860:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     867:	e8 58 08 00 00       	call   10c4 <malloc>
     86c:	89 06                	mov    %eax,(%esi)
  strcpy(arg3[0], "time");
     86e:	83 c4 08             	add    $0x8,%esp
     871:	68 56 17 00 00       	push   $0x1756
     876:	50                   	push   %eax
     877:	e8 00 02 00 00       	call   a7c <strcpy>
  arg3[1] = malloc(sizeof(char) * 5);
     87c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     883:	e8 3c 08 00 00       	call   10c4 <malloc>
     888:	89 46 04             	mov    %eax,0x4(%esi)
  strcpy(arg3[1], "date");
     88b:	83 c4 08             	add    $0x8,%esp
     88e:	68 5f 17 00 00       	push   $0x175f
     893:	50                   	push   %eax
     894:	e8 e3 01 00 00       	call   a7c <strcpy>

  // multi arg (succeeds)
  arg4[0] = malloc(sizeof(char) * 5);
     899:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     8a0:	e8 1f 08 00 00       	call   10c4 <malloc>
     8a5:	89 03                	mov    %eax,(%ebx)
  strcpy(arg4[0], "time");
     8a7:	83 c4 08             	add    $0x8,%esp
     8aa:	68 56 17 00 00       	push   $0x1756
     8af:	50                   	push   %eax
     8b0:	e8 c7 01 00 00       	call   a7c <strcpy>
  arg4[1] = malloc(sizeof(char) * 5);
     8b5:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     8bc:	e8 03 08 00 00       	call   10c4 <malloc>
     8c1:	89 43 04             	mov    %eax,0x4(%ebx)
  strcpy(arg4[1], "time");
     8c4:	83 c4 08             	add    $0x8,%esp
     8c7:	68 56 17 00 00       	push   $0x1756
     8cc:	50                   	push   %eax
     8cd:	e8 aa 01 00 00       	call   a7c <strcpy>
  arg4[2] = malloc(sizeof(char) * 5);
     8d2:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     8d9:	e8 e6 07 00 00       	call   10c4 <malloc>
     8de:	89 43 08             	mov    %eax,0x8(%ebx)
  strcpy(arg4[2], "echo");
     8e1:	83 c4 08             	add    $0x8,%esp
     8e4:	68 64 17 00 00       	push   $0x1764
     8e9:	50                   	push   %eax
     8ea:	e8 8d 01 00 00       	call   a7c <strcpy>
  arg4[3] = malloc(sizeof(char) * 6);
     8ef:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
     8f6:	e8 c9 07 00 00       	call   10c4 <malloc>
     8fb:	89 43 0c             	mov    %eax,0xc(%ebx)
  strcpy(arg4[3], "\"abc\"");
     8fe:	83 c4 08             	add    $0x8,%esp
     901:	68 69 17 00 00       	push   $0x1769
     906:	50                   	push   %eax
     907:	e8 70 01 00 00       	call   a7c <strcpy>

  printf(1, "\n----------\nRunning Time Test\n----------\n");
     90c:	83 c4 08             	add    $0x8,%esp
     90f:	68 5c 16 00 00       	push   $0x165c
     914:	6a 01                	push   $0x1
     916:	e8 78 05 00 00       	call   e93 <printf>
  printf(1, "You will need to verify these tests passed\n");
     91b:	83 c4 08             	add    $0x8,%esp
     91e:	68 88 16 00 00       	push   $0x1688
     923:	6a 01                	push   $0x1
     925:	e8 69 05 00 00       	call   e93 <printf>

  printf(1,"\n%s\n", arg1[0]);
     92a:	83 c4 0c             	add    $0xc,%esp
     92d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     930:	ff 32                	pushl  (%edx)
     932:	68 6f 17 00 00       	push   $0x176f
     937:	6a 01                	push   $0x1
     939:	e8 55 05 00 00       	call   e93 <printf>
  testtimewitharg(arg1);
     93e:	83 c4 04             	add    $0x4,%esp
     941:	ff 75 e4             	pushl  -0x1c(%ebp)
     944:	e8 22 fe ff ff       	call   76b <testtimewitharg>
  printf(1,"\n%s %s\n", arg2[0], arg2[1]);
     949:	ff 77 04             	pushl  0x4(%edi)
     94c:	ff 37                	pushl  (%edi)
     94e:	68 74 17 00 00       	push   $0x1774
     953:	6a 01                	push   $0x1
     955:	e8 39 05 00 00       	call   e93 <printf>
  testtimewitharg(arg2);
     95a:	83 c4 14             	add    $0x14,%esp
     95d:	57                   	push   %edi
     95e:	e8 08 fe ff ff       	call   76b <testtimewitharg>
  printf(1,"\n%s %s\n", arg3[0], arg3[1]);
     963:	ff 76 04             	pushl  0x4(%esi)
     966:	ff 36                	pushl  (%esi)
     968:	68 74 17 00 00       	push   $0x1774
     96d:	6a 01                	push   $0x1
     96f:	e8 1f 05 00 00       	call   e93 <printf>
  testtimewitharg(arg3);
     974:	83 c4 14             	add    $0x14,%esp
     977:	56                   	push   %esi
     978:	e8 ee fd ff ff       	call   76b <testtimewitharg>
  printf(1,"\n%s %s %s %s\n", arg4[0], arg4[1], arg4[2], arg4[3]);
     97d:	83 c4 08             	add    $0x8,%esp
     980:	ff 73 0c             	pushl  0xc(%ebx)
     983:	ff 73 08             	pushl  0x8(%ebx)
     986:	ff 73 04             	pushl  0x4(%ebx)
     989:	ff 33                	pushl  (%ebx)
     98b:	68 7c 17 00 00       	push   $0x177c
     990:	6a 01                	push   $0x1
     992:	e8 fc 04 00 00       	call   e93 <printf>
  testtimewitharg(arg4);
     997:	83 c4 14             	add    $0x14,%esp
     99a:	53                   	push   %ebx
     99b:	e8 cb fd ff ff       	call   76b <testtimewitharg>

  free(arg1[0]);
     9a0:	83 c4 04             	add    $0x4,%esp
     9a3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     9a6:	ff 32                	pushl  (%edx)
     9a8:	e8 53 06 00 00       	call   1000 <free>
  free(arg1);
     9ad:	83 c4 04             	add    $0x4,%esp
     9b0:	ff 75 e4             	pushl  -0x1c(%ebp)
     9b3:	e8 48 06 00 00       	call   1000 <free>
  free(arg2[0]); free(arg2[1]);
     9b8:	83 c4 04             	add    $0x4,%esp
     9bb:	ff 37                	pushl  (%edi)
     9bd:	e8 3e 06 00 00       	call   1000 <free>
     9c2:	83 c4 04             	add    $0x4,%esp
     9c5:	ff 77 04             	pushl  0x4(%edi)
     9c8:	e8 33 06 00 00       	call   1000 <free>
  free(arg2);
     9cd:	89 3c 24             	mov    %edi,(%esp)
     9d0:	e8 2b 06 00 00       	call   1000 <free>
  free(arg3[0]); free(arg3[1]);
     9d5:	83 c4 04             	add    $0x4,%esp
     9d8:	ff 36                	pushl  (%esi)
     9da:	e8 21 06 00 00       	call   1000 <free>
     9df:	83 c4 04             	add    $0x4,%esp
     9e2:	ff 76 04             	pushl  0x4(%esi)
     9e5:	e8 16 06 00 00       	call   1000 <free>
  free(arg3);
     9ea:	89 34 24             	mov    %esi,(%esp)
     9ed:	e8 0e 06 00 00       	call   1000 <free>
  free(arg4[0]); free(arg4[1]); free(arg4[2]); free(arg4[3]);
     9f2:	83 c4 04             	add    $0x4,%esp
     9f5:	ff 33                	pushl  (%ebx)
     9f7:	e8 04 06 00 00       	call   1000 <free>
     9fc:	83 c4 04             	add    $0x4,%esp
     9ff:	ff 73 04             	pushl  0x4(%ebx)
     a02:	e8 f9 05 00 00       	call   1000 <free>
     a07:	83 c4 04             	add    $0x4,%esp
     a0a:	ff 73 08             	pushl  0x8(%ebx)
     a0d:	e8 ee 05 00 00       	call   1000 <free>
     a12:	83 c4 04             	add    $0x4,%esp
     a15:	ff 73 0c             	pushl  0xc(%ebx)
     a18:	e8 e3 05 00 00       	call   1000 <free>
  free(arg4);
     a1d:	89 1c 24             	mov    %ebx,(%esp)
     a20:	e8 db 05 00 00       	call   1000 <free>
}
     a25:	83 c4 10             	add    $0x10,%esp
     a28:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a2b:	5b                   	pop    %ebx
     a2c:	5e                   	pop    %esi
     a2d:	5f                   	pop    %edi
     a2e:	5d                   	pop    %ebp
     a2f:	c3                   	ret    

00000a30 <main>:
#endif

int
main(int argc, char *argv[])
{
     a30:	f3 0f 1e fb          	endbr32 
     a34:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     a38:	83 e4 f0             	and    $0xfffffff0,%esp
     a3b:	ff 71 fc             	pushl  -0x4(%ecx)
     a3e:	55                   	push   %ebp
     a3f:	89 e5                	mov    %esp,%ebp
     a41:	51                   	push   %ecx
     a42:	83 ec 04             	sub    $0x4,%esp
     a45:	8b 41 04             	mov    0x4(%ecx),%eax
  #ifdef CPUTIME_TEST
  testcputime(argv[0]);
     a48:	8b 00                	mov    (%eax),%eax
     a4a:	e8 df f7 ff ff       	call   22e <testcputime>
  #endif
  #ifdef UIDGIDPPID_TEST
  testuidgid();
     a4f:	e8 43 fa ff ff       	call   497 <testuidgid>
  testuidgidinheritance();
     a54:	e8 ed fb ff ff       	call   646 <testuidgidinheritance>
  testppid();
     a59:	e8 aa fc ff ff       	call   708 <testppid>
  #endif
  #ifdef GETPROCS_TEST
  testgetprocs();  // no need to pass argv[0]
     a5e:	e8 a5 f6 ff ff       	call   108 <testgetprocs>
  #endif
  #ifdef TIME_TEST
  testtime();
     a63:	e8 5f fd ff ff       	call   7c7 <testtime>
  #endif
  printf(1, "\n** End of Tests **\n");
     a68:	83 ec 08             	sub    $0x8,%esp
     a6b:	68 8a 17 00 00       	push   $0x178a
     a70:	6a 01                	push   $0x1
     a72:	e8 1c 04 00 00       	call   e93 <printf>
  exit();
     a77:	e8 96 02 00 00       	call   d12 <exit>

00000a7c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     a7c:	f3 0f 1e fb          	endbr32 
     a80:	55                   	push   %ebp
     a81:	89 e5                	mov    %esp,%ebp
     a83:	56                   	push   %esi
     a84:	53                   	push   %ebx
     a85:	8b 75 08             	mov    0x8(%ebp),%esi
     a88:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     a8b:	89 f0                	mov    %esi,%eax
     a8d:	89 d1                	mov    %edx,%ecx
     a8f:	83 c2 01             	add    $0x1,%edx
     a92:	89 c3                	mov    %eax,%ebx
     a94:	83 c0 01             	add    $0x1,%eax
     a97:	0f b6 09             	movzbl (%ecx),%ecx
     a9a:	88 0b                	mov    %cl,(%ebx)
     a9c:	84 c9                	test   %cl,%cl
     a9e:	75 ed                	jne    a8d <strcpy+0x11>
    ;
  return os;
}
     aa0:	89 f0                	mov    %esi,%eax
     aa2:	5b                   	pop    %ebx
     aa3:	5e                   	pop    %esi
     aa4:	5d                   	pop    %ebp
     aa5:	c3                   	ret    

00000aa6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     aa6:	f3 0f 1e fb          	endbr32 
     aaa:	55                   	push   %ebp
     aab:	89 e5                	mov    %esp,%ebp
     aad:	8b 4d 08             	mov    0x8(%ebp),%ecx
     ab0:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     ab3:	0f b6 01             	movzbl (%ecx),%eax
     ab6:	84 c0                	test   %al,%al
     ab8:	74 0c                	je     ac6 <strcmp+0x20>
     aba:	3a 02                	cmp    (%edx),%al
     abc:	75 08                	jne    ac6 <strcmp+0x20>
    p++, q++;
     abe:	83 c1 01             	add    $0x1,%ecx
     ac1:	83 c2 01             	add    $0x1,%edx
     ac4:	eb ed                	jmp    ab3 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
     ac6:	0f b6 c0             	movzbl %al,%eax
     ac9:	0f b6 12             	movzbl (%edx),%edx
     acc:	29 d0                	sub    %edx,%eax
}
     ace:	5d                   	pop    %ebp
     acf:	c3                   	ret    

00000ad0 <strlen>:

uint
strlen(char *s)
{
     ad0:	f3 0f 1e fb          	endbr32 
     ad4:	55                   	push   %ebp
     ad5:	89 e5                	mov    %esp,%ebp
     ad7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     ada:	b8 00 00 00 00       	mov    $0x0,%eax
     adf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
     ae3:	74 05                	je     aea <strlen+0x1a>
     ae5:	83 c0 01             	add    $0x1,%eax
     ae8:	eb f5                	jmp    adf <strlen+0xf>
    ;
  return n;
}
     aea:	5d                   	pop    %ebp
     aeb:	c3                   	ret    

00000aec <memset>:

void*
memset(void *dst, int c, uint n)
{
     aec:	f3 0f 1e fb          	endbr32 
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	57                   	push   %edi
     af4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     af7:	89 d7                	mov    %edx,%edi
     af9:	8b 4d 10             	mov    0x10(%ebp),%ecx
     afc:	8b 45 0c             	mov    0xc(%ebp),%eax
     aff:	fc                   	cld    
     b00:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     b02:	89 d0                	mov    %edx,%eax
     b04:	5f                   	pop    %edi
     b05:	5d                   	pop    %ebp
     b06:	c3                   	ret    

00000b07 <strchr>:

char*
strchr(const char *s, char c)
{
     b07:	f3 0f 1e fb          	endbr32 
     b0b:	55                   	push   %ebp
     b0c:	89 e5                	mov    %esp,%ebp
     b0e:	8b 45 08             	mov    0x8(%ebp),%eax
     b11:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     b15:	0f b6 10             	movzbl (%eax),%edx
     b18:	84 d2                	test   %dl,%dl
     b1a:	74 09                	je     b25 <strchr+0x1e>
    if(*s == c)
     b1c:	38 ca                	cmp    %cl,%dl
     b1e:	74 0a                	je     b2a <strchr+0x23>
  for(; *s; s++)
     b20:	83 c0 01             	add    $0x1,%eax
     b23:	eb f0                	jmp    b15 <strchr+0xe>
      return (char*)s;
  return 0;
     b25:	b8 00 00 00 00       	mov    $0x0,%eax
}
     b2a:	5d                   	pop    %ebp
     b2b:	c3                   	ret    

00000b2c <gets>:

char*
gets(char *buf, int max)
{
     b2c:	f3 0f 1e fb          	endbr32 
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	57                   	push   %edi
     b34:	56                   	push   %esi
     b35:	53                   	push   %ebx
     b36:	83 ec 1c             	sub    $0x1c,%esp
     b39:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b3c:	bb 00 00 00 00       	mov    $0x0,%ebx
     b41:	89 de                	mov    %ebx,%esi
     b43:	83 c3 01             	add    $0x1,%ebx
     b46:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     b49:	7d 2e                	jge    b79 <gets+0x4d>
    cc = read(0, &c, 1);
     b4b:	83 ec 04             	sub    $0x4,%esp
     b4e:	6a 01                	push   $0x1
     b50:	8d 45 e7             	lea    -0x19(%ebp),%eax
     b53:	50                   	push   %eax
     b54:	6a 00                	push   $0x0
     b56:	e8 cf 01 00 00       	call   d2a <read>
    if(cc < 1)
     b5b:	83 c4 10             	add    $0x10,%esp
     b5e:	85 c0                	test   %eax,%eax
     b60:	7e 17                	jle    b79 <gets+0x4d>
      break;
    buf[i++] = c;
     b62:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     b66:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
     b69:	3c 0a                	cmp    $0xa,%al
     b6b:	0f 94 c2             	sete   %dl
     b6e:	3c 0d                	cmp    $0xd,%al
     b70:	0f 94 c0             	sete   %al
     b73:	08 c2                	or     %al,%dl
     b75:	74 ca                	je     b41 <gets+0x15>
    buf[i++] = c;
     b77:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
     b79:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
     b7d:	89 f8                	mov    %edi,%eax
     b7f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b82:	5b                   	pop    %ebx
     b83:	5e                   	pop    %esi
     b84:	5f                   	pop    %edi
     b85:	5d                   	pop    %ebp
     b86:	c3                   	ret    

00000b87 <stat>:

int
stat(char *n, struct stat *st)
{
     b87:	f3 0f 1e fb          	endbr32 
     b8b:	55                   	push   %ebp
     b8c:	89 e5                	mov    %esp,%ebp
     b8e:	56                   	push   %esi
     b8f:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     b90:	83 ec 08             	sub    $0x8,%esp
     b93:	6a 00                	push   $0x0
     b95:	ff 75 08             	pushl  0x8(%ebp)
     b98:	e8 b5 01 00 00       	call   d52 <open>
  if(fd < 0)
     b9d:	83 c4 10             	add    $0x10,%esp
     ba0:	85 c0                	test   %eax,%eax
     ba2:	78 24                	js     bc8 <stat+0x41>
     ba4:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
     ba6:	83 ec 08             	sub    $0x8,%esp
     ba9:	ff 75 0c             	pushl  0xc(%ebp)
     bac:	50                   	push   %eax
     bad:	e8 b8 01 00 00       	call   d6a <fstat>
     bb2:	89 c6                	mov    %eax,%esi
  close(fd);
     bb4:	89 1c 24             	mov    %ebx,(%esp)
     bb7:	e8 7e 01 00 00       	call   d3a <close>
  return r;
     bbc:	83 c4 10             	add    $0x10,%esp
}
     bbf:	89 f0                	mov    %esi,%eax
     bc1:	8d 65 f8             	lea    -0x8(%ebp),%esp
     bc4:	5b                   	pop    %ebx
     bc5:	5e                   	pop    %esi
     bc6:	5d                   	pop    %ebp
     bc7:	c3                   	ret    
    return -1;
     bc8:	be ff ff ff ff       	mov    $0xffffffff,%esi
     bcd:	eb f0                	jmp    bbf <stat+0x38>

00000bcf <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
     bcf:	f3 0f 1e fb          	endbr32 
     bd3:	55                   	push   %ebp
     bd4:	89 e5                	mov    %esp,%ebp
     bd6:	57                   	push   %edi
     bd7:	56                   	push   %esi
     bd8:	53                   	push   %ebx
     bd9:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
     bdc:	0f b6 02             	movzbl (%edx),%eax
     bdf:	3c 20                	cmp    $0x20,%al
     be1:	75 05                	jne    be8 <atoi+0x19>
     be3:	83 c2 01             	add    $0x1,%edx
     be6:	eb f4                	jmp    bdc <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
     be8:	3c 2d                	cmp    $0x2d,%al
     bea:	74 1d                	je     c09 <atoi+0x3a>
     bec:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
     bf1:	3c 2b                	cmp    $0x2b,%al
     bf3:	0f 94 c1             	sete   %cl
     bf6:	3c 2d                	cmp    $0x2d,%al
     bf8:	0f 94 c0             	sete   %al
     bfb:	08 c1                	or     %al,%cl
     bfd:	74 03                	je     c02 <atoi+0x33>
    s++;
     bff:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
     c02:	b8 00 00 00 00       	mov    $0x0,%eax
     c07:	eb 17                	jmp    c20 <atoi+0x51>
     c09:	bf ff ff ff ff       	mov    $0xffffffff,%edi
     c0e:	eb e1                	jmp    bf1 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
     c10:	8d 34 80             	lea    (%eax,%eax,4),%esi
     c13:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
     c16:	83 c2 01             	add    $0x1,%edx
     c19:	0f be c9             	movsbl %cl,%ecx
     c1c:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
     c20:	0f b6 0a             	movzbl (%edx),%ecx
     c23:	8d 59 d0             	lea    -0x30(%ecx),%ebx
     c26:	80 fb 09             	cmp    $0x9,%bl
     c29:	76 e5                	jbe    c10 <atoi+0x41>
  return sign*n;
     c2b:	0f af c7             	imul   %edi,%eax
}
     c2e:	5b                   	pop    %ebx
     c2f:	5e                   	pop    %esi
     c30:	5f                   	pop    %edi
     c31:	5d                   	pop    %ebp
     c32:	c3                   	ret    

00000c33 <atoo>:

int
atoo(const char *s)
{
     c33:	f3 0f 1e fb          	endbr32 
     c37:	55                   	push   %ebp
     c38:	89 e5                	mov    %esp,%ebp
     c3a:	57                   	push   %edi
     c3b:	56                   	push   %esi
     c3c:	53                   	push   %ebx
     c3d:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
     c40:	0f b6 0a             	movzbl (%edx),%ecx
     c43:	80 f9 20             	cmp    $0x20,%cl
     c46:	75 05                	jne    c4d <atoo+0x1a>
     c48:	83 c2 01             	add    $0x1,%edx
     c4b:	eb f3                	jmp    c40 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
     c4d:	80 f9 2d             	cmp    $0x2d,%cl
     c50:	74 23                	je     c75 <atoo+0x42>
     c52:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
     c57:	80 f9 2b             	cmp    $0x2b,%cl
     c5a:	0f 94 c0             	sete   %al
     c5d:	89 c6                	mov    %eax,%esi
     c5f:	80 f9 2d             	cmp    $0x2d,%cl
     c62:	0f 94 c0             	sete   %al
     c65:	89 f3                	mov    %esi,%ebx
     c67:	08 c3                	or     %al,%bl
     c69:	74 03                	je     c6e <atoo+0x3b>
    s++;
     c6b:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
     c6e:	b8 00 00 00 00       	mov    $0x0,%eax
     c73:	eb 11                	jmp    c86 <atoo+0x53>
     c75:	bf ff ff ff ff       	mov    $0xffffffff,%edi
     c7a:	eb db                	jmp    c57 <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
     c7c:	83 c2 01             	add    $0x1,%edx
     c7f:	0f be c9             	movsbl %cl,%ecx
     c82:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
     c86:	0f b6 0a             	movzbl (%edx),%ecx
     c89:	8d 59 d0             	lea    -0x30(%ecx),%ebx
     c8c:	80 fb 07             	cmp    $0x7,%bl
     c8f:	76 eb                	jbe    c7c <atoo+0x49>
  return sign*n;
     c91:	0f af c7             	imul   %edi,%eax
}
     c94:	5b                   	pop    %ebx
     c95:	5e                   	pop    %esi
     c96:	5f                   	pop    %edi
     c97:	5d                   	pop    %ebp
     c98:	c3                   	ret    

00000c99 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
     c99:	f3 0f 1e fb          	endbr32 
     c9d:	55                   	push   %ebp
     c9e:	89 e5                	mov    %esp,%ebp
     ca0:	53                   	push   %ebx
     ca1:	8b 55 08             	mov    0x8(%ebp),%edx
     ca4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     ca7:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
     caa:	eb 09                	jmp    cb5 <strncmp+0x1c>
      n--, p++, q++;
     cac:	83 e8 01             	sub    $0x1,%eax
     caf:	83 c2 01             	add    $0x1,%edx
     cb2:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
     cb5:	85 c0                	test   %eax,%eax
     cb7:	74 0b                	je     cc4 <strncmp+0x2b>
     cb9:	0f b6 1a             	movzbl (%edx),%ebx
     cbc:	84 db                	test   %bl,%bl
     cbe:	74 04                	je     cc4 <strncmp+0x2b>
     cc0:	3a 19                	cmp    (%ecx),%bl
     cc2:	74 e8                	je     cac <strncmp+0x13>
    if(n == 0)
     cc4:	85 c0                	test   %eax,%eax
     cc6:	74 0b                	je     cd3 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
     cc8:	0f b6 02             	movzbl (%edx),%eax
     ccb:	0f b6 11             	movzbl (%ecx),%edx
     cce:	29 d0                	sub    %edx,%eax
}
     cd0:	5b                   	pop    %ebx
     cd1:	5d                   	pop    %ebp
     cd2:	c3                   	ret    
      return 0;
     cd3:	b8 00 00 00 00       	mov    $0x0,%eax
     cd8:	eb f6                	jmp    cd0 <strncmp+0x37>

00000cda <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
     cda:	f3 0f 1e fb          	endbr32 
     cde:	55                   	push   %ebp
     cdf:	89 e5                	mov    %esp,%ebp
     ce1:	56                   	push   %esi
     ce2:	53                   	push   %ebx
     ce3:	8b 75 08             	mov    0x8(%ebp),%esi
     ce6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     ce9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
     cec:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
     cee:	8d 58 ff             	lea    -0x1(%eax),%ebx
     cf1:	85 c0                	test   %eax,%eax
     cf3:	7e 0f                	jle    d04 <memmove+0x2a>
    *dst++ = *src++;
     cf5:	0f b6 01             	movzbl (%ecx),%eax
     cf8:	88 02                	mov    %al,(%edx)
     cfa:	8d 49 01             	lea    0x1(%ecx),%ecx
     cfd:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
     d00:	89 d8                	mov    %ebx,%eax
     d02:	eb ea                	jmp    cee <memmove+0x14>
  return vdst;
}
     d04:	89 f0                	mov    %esi,%eax
     d06:	5b                   	pop    %ebx
     d07:	5e                   	pop    %esi
     d08:	5d                   	pop    %ebp
     d09:	c3                   	ret    

00000d0a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     d0a:	b8 01 00 00 00       	mov    $0x1,%eax
     d0f:	cd 40                	int    $0x40
     d11:	c3                   	ret    

00000d12 <exit>:
SYSCALL(exit)
     d12:	b8 02 00 00 00       	mov    $0x2,%eax
     d17:	cd 40                	int    $0x40
     d19:	c3                   	ret    

00000d1a <wait>:
SYSCALL(wait)
     d1a:	b8 03 00 00 00       	mov    $0x3,%eax
     d1f:	cd 40                	int    $0x40
     d21:	c3                   	ret    

00000d22 <pipe>:
SYSCALL(pipe)
     d22:	b8 04 00 00 00       	mov    $0x4,%eax
     d27:	cd 40                	int    $0x40
     d29:	c3                   	ret    

00000d2a <read>:
SYSCALL(read)
     d2a:	b8 05 00 00 00       	mov    $0x5,%eax
     d2f:	cd 40                	int    $0x40
     d31:	c3                   	ret    

00000d32 <write>:
SYSCALL(write)
     d32:	b8 10 00 00 00       	mov    $0x10,%eax
     d37:	cd 40                	int    $0x40
     d39:	c3                   	ret    

00000d3a <close>:
SYSCALL(close)
     d3a:	b8 15 00 00 00       	mov    $0x15,%eax
     d3f:	cd 40                	int    $0x40
     d41:	c3                   	ret    

00000d42 <kill>:
SYSCALL(kill)
     d42:	b8 06 00 00 00       	mov    $0x6,%eax
     d47:	cd 40                	int    $0x40
     d49:	c3                   	ret    

00000d4a <exec>:
SYSCALL(exec)
     d4a:	b8 07 00 00 00       	mov    $0x7,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <open>:
SYSCALL(open)
     d52:	b8 0f 00 00 00       	mov    $0xf,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <mknod>:
SYSCALL(mknod)
     d5a:	b8 11 00 00 00       	mov    $0x11,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    

00000d62 <unlink>:
SYSCALL(unlink)
     d62:	b8 12 00 00 00       	mov    $0x12,%eax
     d67:	cd 40                	int    $0x40
     d69:	c3                   	ret    

00000d6a <fstat>:
SYSCALL(fstat)
     d6a:	b8 08 00 00 00       	mov    $0x8,%eax
     d6f:	cd 40                	int    $0x40
     d71:	c3                   	ret    

00000d72 <link>:
SYSCALL(link)
     d72:	b8 13 00 00 00       	mov    $0x13,%eax
     d77:	cd 40                	int    $0x40
     d79:	c3                   	ret    

00000d7a <mkdir>:
SYSCALL(mkdir)
     d7a:	b8 14 00 00 00       	mov    $0x14,%eax
     d7f:	cd 40                	int    $0x40
     d81:	c3                   	ret    

00000d82 <chdir>:
SYSCALL(chdir)
     d82:	b8 09 00 00 00       	mov    $0x9,%eax
     d87:	cd 40                	int    $0x40
     d89:	c3                   	ret    

00000d8a <dup>:
SYSCALL(dup)
     d8a:	b8 0a 00 00 00       	mov    $0xa,%eax
     d8f:	cd 40                	int    $0x40
     d91:	c3                   	ret    

00000d92 <getpid>:
SYSCALL(getpid)
     d92:	b8 0b 00 00 00       	mov    $0xb,%eax
     d97:	cd 40                	int    $0x40
     d99:	c3                   	ret    

00000d9a <sbrk>:
SYSCALL(sbrk)
     d9a:	b8 0c 00 00 00       	mov    $0xc,%eax
     d9f:	cd 40                	int    $0x40
     da1:	c3                   	ret    

00000da2 <sleep>:
SYSCALL(sleep)
     da2:	b8 0d 00 00 00       	mov    $0xd,%eax
     da7:	cd 40                	int    $0x40
     da9:	c3                   	ret    

00000daa <uptime>:
SYSCALL(uptime)
     daa:	b8 0e 00 00 00       	mov    $0xe,%eax
     daf:	cd 40                	int    $0x40
     db1:	c3                   	ret    

00000db2 <halt>:
SYSCALL(halt)
     db2:	b8 16 00 00 00       	mov    $0x16,%eax
     db7:	cd 40                	int    $0x40
     db9:	c3                   	ret    

00000dba <date>:
SYSCALL(date)
     dba:	b8 17 00 00 00       	mov    $0x17,%eax
     dbf:	cd 40                	int    $0x40
     dc1:	c3                   	ret    

00000dc2 <getuid>:
SYSCALL(getuid)
     dc2:	b8 18 00 00 00       	mov    $0x18,%eax
     dc7:	cd 40                	int    $0x40
     dc9:	c3                   	ret    

00000dca <getgid>:
SYSCALL(getgid)
     dca:	b8 19 00 00 00       	mov    $0x19,%eax
     dcf:	cd 40                	int    $0x40
     dd1:	c3                   	ret    

00000dd2 <getppid>:
SYSCALL(getppid)
     dd2:	b8 1a 00 00 00       	mov    $0x1a,%eax
     dd7:	cd 40                	int    $0x40
     dd9:	c3                   	ret    

00000dda <setuid>:
SYSCALL(setuid)
     dda:	b8 1b 00 00 00       	mov    $0x1b,%eax
     ddf:	cd 40                	int    $0x40
     de1:	c3                   	ret    

00000de2 <setgid>:
SYSCALL(setgid)
     de2:	b8 1c 00 00 00       	mov    $0x1c,%eax
     de7:	cd 40                	int    $0x40
     de9:	c3                   	ret    

00000dea <getprocs>:
     dea:	b8 1d 00 00 00       	mov    $0x1d,%eax
     def:	cd 40                	int    $0x40
     df1:	c3                   	ret    

00000df2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     df2:	55                   	push   %ebp
     df3:	89 e5                	mov    %esp,%ebp
     df5:	83 ec 1c             	sub    $0x1c,%esp
     df8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
     dfb:	6a 01                	push   $0x1
     dfd:	8d 55 f4             	lea    -0xc(%ebp),%edx
     e00:	52                   	push   %edx
     e01:	50                   	push   %eax
     e02:	e8 2b ff ff ff       	call   d32 <write>
}
     e07:	83 c4 10             	add    $0x10,%esp
     e0a:	c9                   	leave  
     e0b:	c3                   	ret    

00000e0c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     e0c:	55                   	push   %ebp
     e0d:	89 e5                	mov    %esp,%ebp
     e0f:	57                   	push   %edi
     e10:	56                   	push   %esi
     e11:	53                   	push   %ebx
     e12:	83 ec 2c             	sub    $0x2c,%esp
     e15:	89 45 d0             	mov    %eax,-0x30(%ebp)
     e18:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     e1a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     e1e:	0f 95 c2             	setne  %dl
     e21:	89 f0                	mov    %esi,%eax
     e23:	c1 e8 1f             	shr    $0x1f,%eax
     e26:	84 c2                	test   %al,%dl
     e28:	74 42                	je     e6c <printint+0x60>
    neg = 1;
    x = -xx;
     e2a:	f7 de                	neg    %esi
    neg = 1;
     e2c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     e33:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
     e38:	89 f0                	mov    %esi,%eax
     e3a:	ba 00 00 00 00       	mov    $0x0,%edx
     e3f:	f7 f1                	div    %ecx
     e41:	89 df                	mov    %ebx,%edi
     e43:	83 c3 01             	add    $0x1,%ebx
     e46:	0f b6 92 d8 17 00 00 	movzbl 0x17d8(%edx),%edx
     e4d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
     e51:	89 f2                	mov    %esi,%edx
     e53:	89 c6                	mov    %eax,%esi
     e55:	39 d1                	cmp    %edx,%ecx
     e57:	76 df                	jbe    e38 <printint+0x2c>
  if(neg)
     e59:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
     e5d:	74 2f                	je     e8e <printint+0x82>
    buf[i++] = '-';
     e5f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
     e64:	8d 5f 02             	lea    0x2(%edi),%ebx
     e67:	8b 75 d0             	mov    -0x30(%ebp),%esi
     e6a:	eb 15                	jmp    e81 <printint+0x75>
  neg = 0;
     e6c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     e73:	eb be                	jmp    e33 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
     e75:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
     e7a:	89 f0                	mov    %esi,%eax
     e7c:	e8 71 ff ff ff       	call   df2 <putc>
  while(--i >= 0)
     e81:	83 eb 01             	sub    $0x1,%ebx
     e84:	79 ef                	jns    e75 <printint+0x69>
}
     e86:	83 c4 2c             	add    $0x2c,%esp
     e89:	5b                   	pop    %ebx
     e8a:	5e                   	pop    %esi
     e8b:	5f                   	pop    %edi
     e8c:	5d                   	pop    %ebp
     e8d:	c3                   	ret    
     e8e:	8b 75 d0             	mov    -0x30(%ebp),%esi
     e91:	eb ee                	jmp    e81 <printint+0x75>

00000e93 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e93:	f3 0f 1e fb          	endbr32 
     e97:	55                   	push   %ebp
     e98:	89 e5                	mov    %esp,%ebp
     e9a:	57                   	push   %edi
     e9b:	56                   	push   %esi
     e9c:	53                   	push   %ebx
     e9d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
     ea0:	8d 45 10             	lea    0x10(%ebp),%eax
     ea3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
     ea6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
     eab:	bb 00 00 00 00       	mov    $0x0,%ebx
     eb0:	eb 14                	jmp    ec6 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
     eb2:	89 fa                	mov    %edi,%edx
     eb4:	8b 45 08             	mov    0x8(%ebp),%eax
     eb7:	e8 36 ff ff ff       	call   df2 <putc>
     ebc:	eb 05                	jmp    ec3 <printf+0x30>
      }
    } else if(state == '%'){
     ebe:	83 fe 25             	cmp    $0x25,%esi
     ec1:	74 25                	je     ee8 <printf+0x55>
  for(i = 0; fmt[i]; i++){
     ec3:	83 c3 01             	add    $0x1,%ebx
     ec6:	8b 45 0c             	mov    0xc(%ebp),%eax
     ec9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
     ecd:	84 c0                	test   %al,%al
     ecf:	0f 84 23 01 00 00    	je     ff8 <printf+0x165>
    c = fmt[i] & 0xff;
     ed5:	0f be f8             	movsbl %al,%edi
     ed8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
     edb:	85 f6                	test   %esi,%esi
     edd:	75 df                	jne    ebe <printf+0x2b>
      if(c == '%'){
     edf:	83 f8 25             	cmp    $0x25,%eax
     ee2:	75 ce                	jne    eb2 <printf+0x1f>
        state = '%';
     ee4:	89 c6                	mov    %eax,%esi
     ee6:	eb db                	jmp    ec3 <printf+0x30>
      if(c == 'd'){
     ee8:	83 f8 64             	cmp    $0x64,%eax
     eeb:	74 49                	je     f36 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     eed:	83 f8 78             	cmp    $0x78,%eax
     ef0:	0f 94 c1             	sete   %cl
     ef3:	83 f8 70             	cmp    $0x70,%eax
     ef6:	0f 94 c2             	sete   %dl
     ef9:	08 d1                	or     %dl,%cl
     efb:	75 63                	jne    f60 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     efd:	83 f8 73             	cmp    $0x73,%eax
     f00:	0f 84 84 00 00 00    	je     f8a <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     f06:	83 f8 63             	cmp    $0x63,%eax
     f09:	0f 84 b7 00 00 00    	je     fc6 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     f0f:	83 f8 25             	cmp    $0x25,%eax
     f12:	0f 84 cc 00 00 00    	je     fe4 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     f18:	ba 25 00 00 00       	mov    $0x25,%edx
     f1d:	8b 45 08             	mov    0x8(%ebp),%eax
     f20:	e8 cd fe ff ff       	call   df2 <putc>
        putc(fd, c);
     f25:	89 fa                	mov    %edi,%edx
     f27:	8b 45 08             	mov    0x8(%ebp),%eax
     f2a:	e8 c3 fe ff ff       	call   df2 <putc>
      }
      state = 0;
     f2f:	be 00 00 00 00       	mov    $0x0,%esi
     f34:	eb 8d                	jmp    ec3 <printf+0x30>
        printint(fd, *ap, 10, 1);
     f36:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     f39:	8b 17                	mov    (%edi),%edx
     f3b:	83 ec 0c             	sub    $0xc,%esp
     f3e:	6a 01                	push   $0x1
     f40:	b9 0a 00 00 00       	mov    $0xa,%ecx
     f45:	8b 45 08             	mov    0x8(%ebp),%eax
     f48:	e8 bf fe ff ff       	call   e0c <printint>
        ap++;
     f4d:	83 c7 04             	add    $0x4,%edi
     f50:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     f53:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f56:	be 00 00 00 00       	mov    $0x0,%esi
     f5b:	e9 63 ff ff ff       	jmp    ec3 <printf+0x30>
        printint(fd, *ap, 16, 0);
     f60:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     f63:	8b 17                	mov    (%edi),%edx
     f65:	83 ec 0c             	sub    $0xc,%esp
     f68:	6a 00                	push   $0x0
     f6a:	b9 10 00 00 00       	mov    $0x10,%ecx
     f6f:	8b 45 08             	mov    0x8(%ebp),%eax
     f72:	e8 95 fe ff ff       	call   e0c <printint>
        ap++;
     f77:	83 c7 04             	add    $0x4,%edi
     f7a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     f7d:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f80:	be 00 00 00 00       	mov    $0x0,%esi
     f85:	e9 39 ff ff ff       	jmp    ec3 <printf+0x30>
        s = (char*)*ap;
     f8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f8d:	8b 30                	mov    (%eax),%esi
        ap++;
     f8f:	83 c0 04             	add    $0x4,%eax
     f92:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
     f95:	85 f6                	test   %esi,%esi
     f97:	75 28                	jne    fc1 <printf+0x12e>
          s = "(null)";
     f99:	be d0 17 00 00       	mov    $0x17d0,%esi
     f9e:	8b 7d 08             	mov    0x8(%ebp),%edi
     fa1:	eb 0d                	jmp    fb0 <printf+0x11d>
          putc(fd, *s);
     fa3:	0f be d2             	movsbl %dl,%edx
     fa6:	89 f8                	mov    %edi,%eax
     fa8:	e8 45 fe ff ff       	call   df2 <putc>
          s++;
     fad:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
     fb0:	0f b6 16             	movzbl (%esi),%edx
     fb3:	84 d2                	test   %dl,%dl
     fb5:	75 ec                	jne    fa3 <printf+0x110>
      state = 0;
     fb7:	be 00 00 00 00       	mov    $0x0,%esi
     fbc:	e9 02 ff ff ff       	jmp    ec3 <printf+0x30>
     fc1:	8b 7d 08             	mov    0x8(%ebp),%edi
     fc4:	eb ea                	jmp    fb0 <printf+0x11d>
        putc(fd, *ap);
     fc6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     fc9:	0f be 17             	movsbl (%edi),%edx
     fcc:	8b 45 08             	mov    0x8(%ebp),%eax
     fcf:	e8 1e fe ff ff       	call   df2 <putc>
        ap++;
     fd4:	83 c7 04             	add    $0x4,%edi
     fd7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
     fda:	be 00 00 00 00       	mov    $0x0,%esi
     fdf:	e9 df fe ff ff       	jmp    ec3 <printf+0x30>
        putc(fd, c);
     fe4:	89 fa                	mov    %edi,%edx
     fe6:	8b 45 08             	mov    0x8(%ebp),%eax
     fe9:	e8 04 fe ff ff       	call   df2 <putc>
      state = 0;
     fee:	be 00 00 00 00       	mov    $0x0,%esi
     ff3:	e9 cb fe ff ff       	jmp    ec3 <printf+0x30>
    }
  }
}
     ff8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ffb:	5b                   	pop    %ebx
     ffc:	5e                   	pop    %esi
     ffd:	5f                   	pop    %edi
     ffe:	5d                   	pop    %ebp
     fff:	c3                   	ret    

00001000 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	55                   	push   %ebp
    1005:	89 e5                	mov    %esp,%ebp
    1007:	57                   	push   %edi
    1008:	56                   	push   %esi
    1009:	53                   	push   %ebx
    100a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    100d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1010:	a1 e0 1c 00 00       	mov    0x1ce0,%eax
    1015:	eb 02                	jmp    1019 <free+0x19>
    1017:	89 d0                	mov    %edx,%eax
    1019:	39 c8                	cmp    %ecx,%eax
    101b:	73 04                	jae    1021 <free+0x21>
    101d:	39 08                	cmp    %ecx,(%eax)
    101f:	77 12                	ja     1033 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1021:	8b 10                	mov    (%eax),%edx
    1023:	39 c2                	cmp    %eax,%edx
    1025:	77 f0                	ja     1017 <free+0x17>
    1027:	39 c8                	cmp    %ecx,%eax
    1029:	72 08                	jb     1033 <free+0x33>
    102b:	39 ca                	cmp    %ecx,%edx
    102d:	77 04                	ja     1033 <free+0x33>
    102f:	89 d0                	mov    %edx,%eax
    1031:	eb e6                	jmp    1019 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1033:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1036:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1039:	8b 10                	mov    (%eax),%edx
    103b:	39 d7                	cmp    %edx,%edi
    103d:	74 19                	je     1058 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    103f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1042:	8b 50 04             	mov    0x4(%eax),%edx
    1045:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1048:	39 ce                	cmp    %ecx,%esi
    104a:	74 1b                	je     1067 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    104c:	89 08                	mov    %ecx,(%eax)
  freep = p;
    104e:	a3 e0 1c 00 00       	mov    %eax,0x1ce0
}
    1053:	5b                   	pop    %ebx
    1054:	5e                   	pop    %esi
    1055:	5f                   	pop    %edi
    1056:	5d                   	pop    %ebp
    1057:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    1058:	03 72 04             	add    0x4(%edx),%esi
    105b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    105e:	8b 10                	mov    (%eax),%edx
    1060:	8b 12                	mov    (%edx),%edx
    1062:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1065:	eb db                	jmp    1042 <free+0x42>
    p->s.size += bp->s.size;
    1067:	03 53 fc             	add    -0x4(%ebx),%edx
    106a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    106d:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1070:	89 10                	mov    %edx,(%eax)
    1072:	eb da                	jmp    104e <free+0x4e>

00001074 <morecore>:

static Header*
morecore(uint nu)
{
    1074:	55                   	push   %ebp
    1075:	89 e5                	mov    %esp,%ebp
    1077:	53                   	push   %ebx
    1078:	83 ec 04             	sub    $0x4,%esp
    107b:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    107d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    1082:	77 05                	ja     1089 <morecore+0x15>
    nu = 4096;
    1084:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    1089:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    1090:	83 ec 0c             	sub    $0xc,%esp
    1093:	50                   	push   %eax
    1094:	e8 01 fd ff ff       	call   d9a <sbrk>
  if(p == (char*)-1)
    1099:	83 c4 10             	add    $0x10,%esp
    109c:	83 f8 ff             	cmp    $0xffffffff,%eax
    109f:	74 1c                	je     10bd <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    10a1:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    10a4:	83 c0 08             	add    $0x8,%eax
    10a7:	83 ec 0c             	sub    $0xc,%esp
    10aa:	50                   	push   %eax
    10ab:	e8 50 ff ff ff       	call   1000 <free>
  return freep;
    10b0:	a1 e0 1c 00 00       	mov    0x1ce0,%eax
    10b5:	83 c4 10             	add    $0x10,%esp
}
    10b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10bb:	c9                   	leave  
    10bc:	c3                   	ret    
    return 0;
    10bd:	b8 00 00 00 00       	mov    $0x0,%eax
    10c2:	eb f4                	jmp    10b8 <morecore+0x44>

000010c4 <malloc>:

void*
malloc(uint nbytes)
{
    10c4:	f3 0f 1e fb          	endbr32 
    10c8:	55                   	push   %ebp
    10c9:	89 e5                	mov    %esp,%ebp
    10cb:	53                   	push   %ebx
    10cc:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10cf:	8b 45 08             	mov    0x8(%ebp),%eax
    10d2:	8d 58 07             	lea    0x7(%eax),%ebx
    10d5:	c1 eb 03             	shr    $0x3,%ebx
    10d8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    10db:	8b 0d e0 1c 00 00    	mov    0x1ce0,%ecx
    10e1:	85 c9                	test   %ecx,%ecx
    10e3:	74 04                	je     10e9 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10e5:	8b 01                	mov    (%ecx),%eax
    10e7:	eb 4b                	jmp    1134 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
    10e9:	c7 05 e0 1c 00 00 e4 	movl   $0x1ce4,0x1ce0
    10f0:	1c 00 00 
    10f3:	c7 05 e4 1c 00 00 e4 	movl   $0x1ce4,0x1ce4
    10fa:	1c 00 00 
    base.s.size = 0;
    10fd:	c7 05 e8 1c 00 00 00 	movl   $0x0,0x1ce8
    1104:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    1107:	b9 e4 1c 00 00       	mov    $0x1ce4,%ecx
    110c:	eb d7                	jmp    10e5 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    110e:	74 1a                	je     112a <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1110:	29 da                	sub    %ebx,%edx
    1112:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1115:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    1118:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    111b:	89 0d e0 1c 00 00    	mov    %ecx,0x1ce0
      return (void*)(p + 1);
    1121:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1124:	83 c4 04             	add    $0x4,%esp
    1127:	5b                   	pop    %ebx
    1128:	5d                   	pop    %ebp
    1129:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    112a:	8b 10                	mov    (%eax),%edx
    112c:	89 11                	mov    %edx,(%ecx)
    112e:	eb eb                	jmp    111b <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1130:	89 c1                	mov    %eax,%ecx
    1132:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    1134:	8b 50 04             	mov    0x4(%eax),%edx
    1137:	39 da                	cmp    %ebx,%edx
    1139:	73 d3                	jae    110e <malloc+0x4a>
    if(p == freep)
    113b:	39 05 e0 1c 00 00    	cmp    %eax,0x1ce0
    1141:	75 ed                	jne    1130 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
    1143:	89 d8                	mov    %ebx,%eax
    1145:	e8 2a ff ff ff       	call   1074 <morecore>
    114a:	85 c0                	test   %eax,%eax
    114c:	75 e2                	jne    1130 <malloc+0x6c>
    114e:	eb d4                	jmp    1124 <malloc+0x60>
