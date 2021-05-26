
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "uproc.h"

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	83 ec 24             	sub    $0x24,%esp
    struct uproc* table;
    int i;
    uint max = 72;
    int catch = 0;
    uint elapsed, decimal, seconds, seconds_decimal;
    table = malloc(sizeof(struct uproc) * max);
  18:	68 e0 19 00 00       	push   $0x19e0
  1d:	e8 d0 07 00 00       	call   7f2 <malloc>
  22:	89 45 dc             	mov    %eax,-0x24(%ebp)
    catch = getprocs(max, table);    
  25:	83 c4 08             	add    $0x8,%esp
  28:	50                   	push   %eax
  29:	6a 48                	push   $0x48
  2b:	e8 e8 04 00 00       	call   518 <getprocs>
  30:	89 45 d8             	mov    %eax,-0x28(%ebp)
    
    if(catch == -1)
  33:	83 c4 10             	add    $0x10,%esp
  36:	83 f8 ff             	cmp    $0xffffffff,%eax
  39:	74 1b                	je     56 <main+0x56>
      printf(1, "\nError: Invalid max or NULL uproc table\n");
    else {
      printf(1, "\nPID\tName\tUID\tGID\tPPID\tElapsed\tCPU\tState\tSize");
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 ac 08 00 00       	push   $0x8ac
  43:	6a 01                	push   $0x1
  45:	e8 77 05 00 00       	call   5c1 <printf>
      for (i = 0;i < catch;++i) {
  4a:	83 c4 10             	add    $0x10,%esp
  4d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  54:	eb 75                	jmp    cb <main+0xcb>
      printf(1, "\nError: Invalid max or NULL uproc table\n");
  56:	83 ec 08             	sub    $0x8,%esp
  59:	68 80 08 00 00       	push   $0x880
  5e:	6a 01                	push   $0x1
  60:	e8 5c 05 00 00       	call   5c1 <printf>
  65:	83 c4 10             	add    $0x10,%esp
  68:	e9 2d 01 00 00       	jmp    19a <main+0x19a>
          seconds_decimal = table[i].CPU_total_ticks % 1000;
          seconds = table[i].CPU_total_ticks / 1000;
          printf(1, "\n%d\t%s\t%d\t%d\t%d\t%d.", table[i].pid, table[i].name, table[i].uid,
          table[i].gid, table[i].ppid, elapsed);
          if(decimal < 10)
            printf(1, "00");
  6d:	83 ec 08             	sub    $0x8,%esp
  70:	68 ee 08 00 00       	push   $0x8ee
  75:	6a 01                	push   $0x1
  77:	e8 45 05 00 00       	call   5c1 <printf>
  7c:	83 c4 10             	add    $0x10,%esp
  7f:	e9 c8 00 00 00       	jmp    14c <main+0x14c>
          else if(decimal < 100)
            printf(1, "0");
  84:	83 ec 08             	sub    $0x8,%esp
  87:	68 ef 08 00 00       	push   $0x8ef
  8c:	6a 01                	push   $0x1
  8e:	e8 2e 05 00 00       	call   5c1 <printf>
  93:	83 c4 10             	add    $0x10,%esp
  96:	e9 b1 00 00 00       	jmp    14c <main+0x14c>
          printf(1, "%d\t%d.", decimal, seconds);
          if(seconds_decimal < 10)
            printf(1, "00");
  9b:	83 ec 08             	sub    $0x8,%esp
  9e:	68 ee 08 00 00       	push   $0x8ee
  a3:	6a 01                	push   $0x1
  a5:	e8 17 05 00 00       	call   5c1 <printf>
  aa:	83 c4 10             	add    $0x10,%esp
          else if(seconds_decimal < 100)
            printf(1, "0");
          printf(1, "%d\t%s\t%d", seconds_decimal, table[i].state, table[i].size);
  ad:	8d 43 18             	lea    0x18(%ebx),%eax
  b0:	83 ec 0c             	sub    $0xc,%esp
  b3:	ff 73 38             	pushl  0x38(%ebx)
  b6:	50                   	push   %eax
  b7:	57                   	push   %edi
  b8:	68 f1 08 00 00       	push   $0x8f1
  bd:	6a 01                	push   $0x1
  bf:	e8 fd 04 00 00       	call   5c1 <printf>
      for (i = 0;i < catch;++i) {
  c4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  c8:	83 c4 20             	add    $0x20,%esp
  cb:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  ce:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
  d1:	0f 8d b1 00 00 00    	jge    188 <main+0x188>
          decimal = table[i].elapsed_ticks % 1000;
  d7:	6b 5d e4 5c          	imul   $0x5c,-0x1c(%ebp),%ebx
  db:	03 5d dc             	add    -0x24(%ebp),%ebx
  de:	8b 4b 10             	mov    0x10(%ebx),%ecx
  e1:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
  e6:	89 c8                	mov    %ecx,%eax
  e8:	f7 e7                	mul    %edi
  ea:	89 d6                	mov    %edx,%esi
  ec:	c1 ee 06             	shr    $0x6,%esi
  ef:	69 c6 e8 03 00 00    	imul   $0x3e8,%esi,%eax
  f5:	29 c1                	sub    %eax,%ecx
  f7:	89 ce                	mov    %ecx,%esi
          elapsed = table[i].elapsed_ticks / 1000;
  f9:	c1 ea 06             	shr    $0x6,%edx
  fc:	89 d1                	mov    %edx,%ecx
          seconds_decimal = table[i].CPU_total_ticks % 1000;
  fe:	89 f8                	mov    %edi,%eax
 100:	f7 63 14             	mull   0x14(%ebx)
 103:	89 d7                	mov    %edx,%edi
 105:	c1 ef 06             	shr    $0x6,%edi
 108:	69 ff e8 03 00 00    	imul   $0x3e8,%edi,%edi
 10e:	8b 43 14             	mov    0x14(%ebx),%eax
 111:	29 f8                	sub    %edi,%eax
 113:	89 c7                	mov    %eax,%edi
          seconds = table[i].CPU_total_ticks / 1000;
 115:	c1 ea 06             	shr    $0x6,%edx
 118:	89 55 e0             	mov    %edx,-0x20(%ebp)
          printf(1, "\n%d\t%s\t%d\t%d\t%d\t%d.", table[i].pid, table[i].name, table[i].uid,
 11b:	8d 43 3c             	lea    0x3c(%ebx),%eax
 11e:	51                   	push   %ecx
 11f:	ff 73 0c             	pushl  0xc(%ebx)
 122:	ff 73 08             	pushl  0x8(%ebx)
 125:	ff 73 04             	pushl  0x4(%ebx)
 128:	50                   	push   %eax
 129:	ff 33                	pushl  (%ebx)
 12b:	68 da 08 00 00       	push   $0x8da
 130:	6a 01                	push   $0x1
 132:	e8 8a 04 00 00       	call   5c1 <printf>
          if(decimal < 10)
 137:	83 c4 20             	add    $0x20,%esp
 13a:	83 fe 09             	cmp    $0x9,%esi
 13d:	0f 86 2a ff ff ff    	jbe    6d <main+0x6d>
          else if(decimal < 100)
 143:	83 fe 63             	cmp    $0x63,%esi
 146:	0f 86 38 ff ff ff    	jbe    84 <main+0x84>
          printf(1, "%d\t%d.", decimal, seconds);
 14c:	ff 75 e0             	pushl  -0x20(%ebp)
 14f:	56                   	push   %esi
 150:	68 e7 08 00 00       	push   $0x8e7
 155:	6a 01                	push   $0x1
 157:	e8 65 04 00 00       	call   5c1 <printf>
          if(seconds_decimal < 10)
 15c:	83 c4 10             	add    $0x10,%esp
 15f:	83 ff 09             	cmp    $0x9,%edi
 162:	0f 86 33 ff ff ff    	jbe    9b <main+0x9b>
          else if(seconds_decimal < 100)
 168:	83 ff 63             	cmp    $0x63,%edi
 16b:	0f 87 3c ff ff ff    	ja     ad <main+0xad>
            printf(1, "0");
 171:	83 ec 08             	sub    $0x8,%esp
 174:	68 ef 08 00 00       	push   $0x8ef
 179:	6a 01                	push   $0x1
 17b:	e8 41 04 00 00       	call   5c1 <printf>
 180:	83 c4 10             	add    $0x10,%esp
 183:	e9 25 ff ff ff       	jmp    ad <main+0xad>
      }
      printf(1, "\n");
 188:	83 ec 08             	sub    $0x8,%esp
 18b:	68 fa 08 00 00       	push   $0x8fa
 190:	6a 01                	push   $0x1
 192:	e8 2a 04 00 00       	call   5c1 <printf>
 197:	83 c4 10             	add    $0x10,%esp
    }
    free(table);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	ff 75 dc             	pushl  -0x24(%ebp)
 1a0:	e8 89 05 00 00       	call   72e <free>
    exit();
 1a5:	e8 96 02 00 00       	call   440 <exit>

000001aa <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1aa:	f3 0f 1e fb          	endbr32 
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	56                   	push   %esi
 1b2:	53                   	push   %ebx
 1b3:	8b 75 08             	mov    0x8(%ebp),%esi
 1b6:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b9:	89 f0                	mov    %esi,%eax
 1bb:	89 d1                	mov    %edx,%ecx
 1bd:	83 c2 01             	add    $0x1,%edx
 1c0:	89 c3                	mov    %eax,%ebx
 1c2:	83 c0 01             	add    $0x1,%eax
 1c5:	0f b6 09             	movzbl (%ecx),%ecx
 1c8:	88 0b                	mov    %cl,(%ebx)
 1ca:	84 c9                	test   %cl,%cl
 1cc:	75 ed                	jne    1bb <strcpy+0x11>
    ;
  return os;
}
 1ce:	89 f0                	mov    %esi,%eax
 1d0:	5b                   	pop    %ebx
 1d1:	5e                   	pop    %esi
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    

000001d4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d4:	f3 0f 1e fb          	endbr32 
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1de:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1e1:	0f b6 01             	movzbl (%ecx),%eax
 1e4:	84 c0                	test   %al,%al
 1e6:	74 0c                	je     1f4 <strcmp+0x20>
 1e8:	3a 02                	cmp    (%edx),%al
 1ea:	75 08                	jne    1f4 <strcmp+0x20>
    p++, q++;
 1ec:	83 c1 01             	add    $0x1,%ecx
 1ef:	83 c2 01             	add    $0x1,%edx
 1f2:	eb ed                	jmp    1e1 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 1f4:	0f b6 c0             	movzbl %al,%eax
 1f7:	0f b6 12             	movzbl (%edx),%edx
 1fa:	29 d0                	sub    %edx,%eax
}
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    

000001fe <strlen>:

uint
strlen(char *s)
{
 1fe:	f3 0f 1e fb          	endbr32 
 202:	55                   	push   %ebp
 203:	89 e5                	mov    %esp,%ebp
 205:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 208:	b8 00 00 00 00       	mov    $0x0,%eax
 20d:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 211:	74 05                	je     218 <strlen+0x1a>
 213:	83 c0 01             	add    $0x1,%eax
 216:	eb f5                	jmp    20d <strlen+0xf>
    ;
  return n;
}
 218:	5d                   	pop    %ebp
 219:	c3                   	ret    

0000021a <memset>:

void*
memset(void *dst, int c, uint n)
{
 21a:	f3 0f 1e fb          	endbr32 
 21e:	55                   	push   %ebp
 21f:	89 e5                	mov    %esp,%ebp
 221:	57                   	push   %edi
 222:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 225:	89 d7                	mov    %edx,%edi
 227:	8b 4d 10             	mov    0x10(%ebp),%ecx
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	fc                   	cld    
 22e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 230:	89 d0                	mov    %edx,%eax
 232:	5f                   	pop    %edi
 233:	5d                   	pop    %ebp
 234:	c3                   	ret    

00000235 <strchr>:

char*
strchr(const char *s, char c)
{
 235:	f3 0f 1e fb          	endbr32 
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 243:	0f b6 10             	movzbl (%eax),%edx
 246:	84 d2                	test   %dl,%dl
 248:	74 09                	je     253 <strchr+0x1e>
    if(*s == c)
 24a:	38 ca                	cmp    %cl,%dl
 24c:	74 0a                	je     258 <strchr+0x23>
  for(; *s; s++)
 24e:	83 c0 01             	add    $0x1,%eax
 251:	eb f0                	jmp    243 <strchr+0xe>
      return (char*)s;
  return 0;
 253:	b8 00 00 00 00       	mov    $0x0,%eax
}
 258:	5d                   	pop    %ebp
 259:	c3                   	ret    

0000025a <gets>:

char*
gets(char *buf, int max)
{
 25a:	f3 0f 1e fb          	endbr32 
 25e:	55                   	push   %ebp
 25f:	89 e5                	mov    %esp,%ebp
 261:	57                   	push   %edi
 262:	56                   	push   %esi
 263:	53                   	push   %ebx
 264:	83 ec 1c             	sub    $0x1c,%esp
 267:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 26a:	bb 00 00 00 00       	mov    $0x0,%ebx
 26f:	89 de                	mov    %ebx,%esi
 271:	83 c3 01             	add    $0x1,%ebx
 274:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 277:	7d 2e                	jge    2a7 <gets+0x4d>
    cc = read(0, &c, 1);
 279:	83 ec 04             	sub    $0x4,%esp
 27c:	6a 01                	push   $0x1
 27e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 281:	50                   	push   %eax
 282:	6a 00                	push   $0x0
 284:	e8 cf 01 00 00       	call   458 <read>
    if(cc < 1)
 289:	83 c4 10             	add    $0x10,%esp
 28c:	85 c0                	test   %eax,%eax
 28e:	7e 17                	jle    2a7 <gets+0x4d>
      break;
    buf[i++] = c;
 290:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 294:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 297:	3c 0a                	cmp    $0xa,%al
 299:	0f 94 c2             	sete   %dl
 29c:	3c 0d                	cmp    $0xd,%al
 29e:	0f 94 c0             	sete   %al
 2a1:	08 c2                	or     %al,%dl
 2a3:	74 ca                	je     26f <gets+0x15>
    buf[i++] = c;
 2a5:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2a7:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2ab:	89 f8                	mov    %edi,%eax
 2ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2b0:	5b                   	pop    %ebx
 2b1:	5e                   	pop    %esi
 2b2:	5f                   	pop    %edi
 2b3:	5d                   	pop    %ebp
 2b4:	c3                   	ret    

000002b5 <stat>:

int
stat(char *n, struct stat *st)
{
 2b5:	f3 0f 1e fb          	endbr32 
 2b9:	55                   	push   %ebp
 2ba:	89 e5                	mov    %esp,%ebp
 2bc:	56                   	push   %esi
 2bd:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2be:	83 ec 08             	sub    $0x8,%esp
 2c1:	6a 00                	push   $0x0
 2c3:	ff 75 08             	pushl  0x8(%ebp)
 2c6:	e8 b5 01 00 00       	call   480 <open>
  if(fd < 0)
 2cb:	83 c4 10             	add    $0x10,%esp
 2ce:	85 c0                	test   %eax,%eax
 2d0:	78 24                	js     2f6 <stat+0x41>
 2d2:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2d4:	83 ec 08             	sub    $0x8,%esp
 2d7:	ff 75 0c             	pushl  0xc(%ebp)
 2da:	50                   	push   %eax
 2db:	e8 b8 01 00 00       	call   498 <fstat>
 2e0:	89 c6                	mov    %eax,%esi
  close(fd);
 2e2:	89 1c 24             	mov    %ebx,(%esp)
 2e5:	e8 7e 01 00 00       	call   468 <close>
  return r;
 2ea:	83 c4 10             	add    $0x10,%esp
}
 2ed:	89 f0                	mov    %esi,%eax
 2ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2f2:	5b                   	pop    %ebx
 2f3:	5e                   	pop    %esi
 2f4:	5d                   	pop    %ebp
 2f5:	c3                   	ret    
    return -1;
 2f6:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2fb:	eb f0                	jmp    2ed <stat+0x38>

000002fd <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 2fd:	f3 0f 1e fb          	endbr32 
 301:	55                   	push   %ebp
 302:	89 e5                	mov    %esp,%ebp
 304:	57                   	push   %edi
 305:	56                   	push   %esi
 306:	53                   	push   %ebx
 307:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 30a:	0f b6 02             	movzbl (%edx),%eax
 30d:	3c 20                	cmp    $0x20,%al
 30f:	75 05                	jne    316 <atoi+0x19>
 311:	83 c2 01             	add    $0x1,%edx
 314:	eb f4                	jmp    30a <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 316:	3c 2d                	cmp    $0x2d,%al
 318:	74 1d                	je     337 <atoi+0x3a>
 31a:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 31f:	3c 2b                	cmp    $0x2b,%al
 321:	0f 94 c1             	sete   %cl
 324:	3c 2d                	cmp    $0x2d,%al
 326:	0f 94 c0             	sete   %al
 329:	08 c1                	or     %al,%cl
 32b:	74 03                	je     330 <atoi+0x33>
    s++;
 32d:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 330:	b8 00 00 00 00       	mov    $0x0,%eax
 335:	eb 17                	jmp    34e <atoi+0x51>
 337:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 33c:	eb e1                	jmp    31f <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 33e:	8d 34 80             	lea    (%eax,%eax,4),%esi
 341:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 344:	83 c2 01             	add    $0x1,%edx
 347:	0f be c9             	movsbl %cl,%ecx
 34a:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 34e:	0f b6 0a             	movzbl (%edx),%ecx
 351:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 354:	80 fb 09             	cmp    $0x9,%bl
 357:	76 e5                	jbe    33e <atoi+0x41>
  return sign*n;
 359:	0f af c7             	imul   %edi,%eax
}
 35c:	5b                   	pop    %ebx
 35d:	5e                   	pop    %esi
 35e:	5f                   	pop    %edi
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    

00000361 <atoo>:

int
atoo(const char *s)
{
 361:	f3 0f 1e fb          	endbr32 
 365:	55                   	push   %ebp
 366:	89 e5                	mov    %esp,%ebp
 368:	57                   	push   %edi
 369:	56                   	push   %esi
 36a:	53                   	push   %ebx
 36b:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 36e:	0f b6 0a             	movzbl (%edx),%ecx
 371:	80 f9 20             	cmp    $0x20,%cl
 374:	75 05                	jne    37b <atoo+0x1a>
 376:	83 c2 01             	add    $0x1,%edx
 379:	eb f3                	jmp    36e <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 37b:	80 f9 2d             	cmp    $0x2d,%cl
 37e:	74 23                	je     3a3 <atoo+0x42>
 380:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 385:	80 f9 2b             	cmp    $0x2b,%cl
 388:	0f 94 c0             	sete   %al
 38b:	89 c6                	mov    %eax,%esi
 38d:	80 f9 2d             	cmp    $0x2d,%cl
 390:	0f 94 c0             	sete   %al
 393:	89 f3                	mov    %esi,%ebx
 395:	08 c3                	or     %al,%bl
 397:	74 03                	je     39c <atoo+0x3b>
    s++;
 399:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 39c:	b8 00 00 00 00       	mov    $0x0,%eax
 3a1:	eb 11                	jmp    3b4 <atoo+0x53>
 3a3:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 3a8:	eb db                	jmp    385 <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 3aa:	83 c2 01             	add    $0x1,%edx
 3ad:	0f be c9             	movsbl %cl,%ecx
 3b0:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 3b4:	0f b6 0a             	movzbl (%edx),%ecx
 3b7:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 3ba:	80 fb 07             	cmp    $0x7,%bl
 3bd:	76 eb                	jbe    3aa <atoo+0x49>
  return sign*n;
 3bf:	0f af c7             	imul   %edi,%eax
}
 3c2:	5b                   	pop    %ebx
 3c3:	5e                   	pop    %esi
 3c4:	5f                   	pop    %edi
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    

000003c7 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 3c7:	f3 0f 1e fb          	endbr32 
 3cb:	55                   	push   %ebp
 3cc:	89 e5                	mov    %esp,%ebp
 3ce:	53                   	push   %ebx
 3cf:	8b 55 08             	mov    0x8(%ebp),%edx
 3d2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d5:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 3d8:	eb 09                	jmp    3e3 <strncmp+0x1c>
      n--, p++, q++;
 3da:	83 e8 01             	sub    $0x1,%eax
 3dd:	83 c2 01             	add    $0x1,%edx
 3e0:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 3e3:	85 c0                	test   %eax,%eax
 3e5:	74 0b                	je     3f2 <strncmp+0x2b>
 3e7:	0f b6 1a             	movzbl (%edx),%ebx
 3ea:	84 db                	test   %bl,%bl
 3ec:	74 04                	je     3f2 <strncmp+0x2b>
 3ee:	3a 19                	cmp    (%ecx),%bl
 3f0:	74 e8                	je     3da <strncmp+0x13>
    if(n == 0)
 3f2:	85 c0                	test   %eax,%eax
 3f4:	74 0b                	je     401 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 3f6:	0f b6 02             	movzbl (%edx),%eax
 3f9:	0f b6 11             	movzbl (%ecx),%edx
 3fc:	29 d0                	sub    %edx,%eax
}
 3fe:	5b                   	pop    %ebx
 3ff:	5d                   	pop    %ebp
 400:	c3                   	ret    
      return 0;
 401:	b8 00 00 00 00       	mov    $0x0,%eax
 406:	eb f6                	jmp    3fe <strncmp+0x37>

00000408 <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 408:	f3 0f 1e fb          	endbr32 
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	56                   	push   %esi
 410:	53                   	push   %ebx
 411:	8b 75 08             	mov    0x8(%ebp),%esi
 414:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 417:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 41a:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 41c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 41f:	85 c0                	test   %eax,%eax
 421:	7e 0f                	jle    432 <memmove+0x2a>
    *dst++ = *src++;
 423:	0f b6 01             	movzbl (%ecx),%eax
 426:	88 02                	mov    %al,(%edx)
 428:	8d 49 01             	lea    0x1(%ecx),%ecx
 42b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 42e:	89 d8                	mov    %ebx,%eax
 430:	eb ea                	jmp    41c <memmove+0x14>
  return vdst;
}
 432:	89 f0                	mov    %esi,%eax
 434:	5b                   	pop    %ebx
 435:	5e                   	pop    %esi
 436:	5d                   	pop    %ebp
 437:	c3                   	ret    

00000438 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 438:	b8 01 00 00 00       	mov    $0x1,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <exit>:
SYSCALL(exit)
 440:	b8 02 00 00 00       	mov    $0x2,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <wait>:
SYSCALL(wait)
 448:	b8 03 00 00 00       	mov    $0x3,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <pipe>:
SYSCALL(pipe)
 450:	b8 04 00 00 00       	mov    $0x4,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <read>:
SYSCALL(read)
 458:	b8 05 00 00 00       	mov    $0x5,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <write>:
SYSCALL(write)
 460:	b8 10 00 00 00       	mov    $0x10,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <close>:
SYSCALL(close)
 468:	b8 15 00 00 00       	mov    $0x15,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <kill>:
SYSCALL(kill)
 470:	b8 06 00 00 00       	mov    $0x6,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <exec>:
SYSCALL(exec)
 478:	b8 07 00 00 00       	mov    $0x7,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <open>:
SYSCALL(open)
 480:	b8 0f 00 00 00       	mov    $0xf,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <mknod>:
SYSCALL(mknod)
 488:	b8 11 00 00 00       	mov    $0x11,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <unlink>:
SYSCALL(unlink)
 490:	b8 12 00 00 00       	mov    $0x12,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <fstat>:
SYSCALL(fstat)
 498:	b8 08 00 00 00       	mov    $0x8,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <link>:
SYSCALL(link)
 4a0:	b8 13 00 00 00       	mov    $0x13,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <mkdir>:
SYSCALL(mkdir)
 4a8:	b8 14 00 00 00       	mov    $0x14,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <chdir>:
SYSCALL(chdir)
 4b0:	b8 09 00 00 00       	mov    $0x9,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <dup>:
SYSCALL(dup)
 4b8:	b8 0a 00 00 00       	mov    $0xa,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <getpid>:
SYSCALL(getpid)
 4c0:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <sbrk>:
SYSCALL(sbrk)
 4c8:	b8 0c 00 00 00       	mov    $0xc,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <sleep>:
SYSCALL(sleep)
 4d0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <uptime>:
SYSCALL(uptime)
 4d8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <halt>:
SYSCALL(halt)
 4e0:	b8 16 00 00 00       	mov    $0x16,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <date>:
SYSCALL(date)
 4e8:	b8 17 00 00 00       	mov    $0x17,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <getuid>:
SYSCALL(getuid)
 4f0:	b8 18 00 00 00       	mov    $0x18,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <getgid>:
SYSCALL(getgid)
 4f8:	b8 19 00 00 00       	mov    $0x19,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <getppid>:
SYSCALL(getppid)
 500:	b8 1a 00 00 00       	mov    $0x1a,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <setuid>:
SYSCALL(setuid)
 508:	b8 1b 00 00 00       	mov    $0x1b,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <setgid>:
SYSCALL(setgid)
 510:	b8 1c 00 00 00       	mov    $0x1c,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <getprocs>:
 518:	b8 1d 00 00 00       	mov    $0x1d,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	83 ec 1c             	sub    $0x1c,%esp
 526:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 529:	6a 01                	push   $0x1
 52b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 52e:	52                   	push   %edx
 52f:	50                   	push   %eax
 530:	e8 2b ff ff ff       	call   460 <write>
}
 535:	83 c4 10             	add    $0x10,%esp
 538:	c9                   	leave  
 539:	c3                   	ret    

0000053a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 53a:	55                   	push   %ebp
 53b:	89 e5                	mov    %esp,%ebp
 53d:	57                   	push   %edi
 53e:	56                   	push   %esi
 53f:	53                   	push   %ebx
 540:	83 ec 2c             	sub    $0x2c,%esp
 543:	89 45 d0             	mov    %eax,-0x30(%ebp)
 546:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 548:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 54c:	0f 95 c2             	setne  %dl
 54f:	89 f0                	mov    %esi,%eax
 551:	c1 e8 1f             	shr    $0x1f,%eax
 554:	84 c2                	test   %al,%dl
 556:	74 42                	je     59a <printint+0x60>
    neg = 1;
    x = -xx;
 558:	f7 de                	neg    %esi
    neg = 1;
 55a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 561:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 566:	89 f0                	mov    %esi,%eax
 568:	ba 00 00 00 00       	mov    $0x0,%edx
 56d:	f7 f1                	div    %ecx
 56f:	89 df                	mov    %ebx,%edi
 571:	83 c3 01             	add    $0x1,%ebx
 574:	0f b6 92 04 09 00 00 	movzbl 0x904(%edx),%edx
 57b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 57f:	89 f2                	mov    %esi,%edx
 581:	89 c6                	mov    %eax,%esi
 583:	39 d1                	cmp    %edx,%ecx
 585:	76 df                	jbe    566 <printint+0x2c>
  if(neg)
 587:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 58b:	74 2f                	je     5bc <printint+0x82>
    buf[i++] = '-';
 58d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 592:	8d 5f 02             	lea    0x2(%edi),%ebx
 595:	8b 75 d0             	mov    -0x30(%ebp),%esi
 598:	eb 15                	jmp    5af <printint+0x75>
  neg = 0;
 59a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5a1:	eb be                	jmp    561 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 5a3:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5a8:	89 f0                	mov    %esi,%eax
 5aa:	e8 71 ff ff ff       	call   520 <putc>
  while(--i >= 0)
 5af:	83 eb 01             	sub    $0x1,%ebx
 5b2:	79 ef                	jns    5a3 <printint+0x69>
}
 5b4:	83 c4 2c             	add    $0x2c,%esp
 5b7:	5b                   	pop    %ebx
 5b8:	5e                   	pop    %esi
 5b9:	5f                   	pop    %edi
 5ba:	5d                   	pop    %ebp
 5bb:	c3                   	ret    
 5bc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5bf:	eb ee                	jmp    5af <printint+0x75>

000005c1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5c1:	f3 0f 1e fb          	endbr32 
 5c5:	55                   	push   %ebp
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5ce:	8d 45 10             	lea    0x10(%ebp),%eax
 5d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5d4:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5d9:	bb 00 00 00 00       	mov    $0x0,%ebx
 5de:	eb 14                	jmp    5f4 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5e0:	89 fa                	mov    %edi,%edx
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
 5e5:	e8 36 ff ff ff       	call   520 <putc>
 5ea:	eb 05                	jmp    5f1 <printf+0x30>
      }
    } else if(state == '%'){
 5ec:	83 fe 25             	cmp    $0x25,%esi
 5ef:	74 25                	je     616 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 5f1:	83 c3 01             	add    $0x1,%ebx
 5f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 5f7:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5fb:	84 c0                	test   %al,%al
 5fd:	0f 84 23 01 00 00    	je     726 <printf+0x165>
    c = fmt[i] & 0xff;
 603:	0f be f8             	movsbl %al,%edi
 606:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 609:	85 f6                	test   %esi,%esi
 60b:	75 df                	jne    5ec <printf+0x2b>
      if(c == '%'){
 60d:	83 f8 25             	cmp    $0x25,%eax
 610:	75 ce                	jne    5e0 <printf+0x1f>
        state = '%';
 612:	89 c6                	mov    %eax,%esi
 614:	eb db                	jmp    5f1 <printf+0x30>
      if(c == 'd'){
 616:	83 f8 64             	cmp    $0x64,%eax
 619:	74 49                	je     664 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 61b:	83 f8 78             	cmp    $0x78,%eax
 61e:	0f 94 c1             	sete   %cl
 621:	83 f8 70             	cmp    $0x70,%eax
 624:	0f 94 c2             	sete   %dl
 627:	08 d1                	or     %dl,%cl
 629:	75 63                	jne    68e <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 62b:	83 f8 73             	cmp    $0x73,%eax
 62e:	0f 84 84 00 00 00    	je     6b8 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 634:	83 f8 63             	cmp    $0x63,%eax
 637:	0f 84 b7 00 00 00    	je     6f4 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 63d:	83 f8 25             	cmp    $0x25,%eax
 640:	0f 84 cc 00 00 00    	je     712 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 646:	ba 25 00 00 00       	mov    $0x25,%edx
 64b:	8b 45 08             	mov    0x8(%ebp),%eax
 64e:	e8 cd fe ff ff       	call   520 <putc>
        putc(fd, c);
 653:	89 fa                	mov    %edi,%edx
 655:	8b 45 08             	mov    0x8(%ebp),%eax
 658:	e8 c3 fe ff ff       	call   520 <putc>
      }
      state = 0;
 65d:	be 00 00 00 00       	mov    $0x0,%esi
 662:	eb 8d                	jmp    5f1 <printf+0x30>
        printint(fd, *ap, 10, 1);
 664:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 667:	8b 17                	mov    (%edi),%edx
 669:	83 ec 0c             	sub    $0xc,%esp
 66c:	6a 01                	push   $0x1
 66e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 673:	8b 45 08             	mov    0x8(%ebp),%eax
 676:	e8 bf fe ff ff       	call   53a <printint>
        ap++;
 67b:	83 c7 04             	add    $0x4,%edi
 67e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 681:	83 c4 10             	add    $0x10,%esp
      state = 0;
 684:	be 00 00 00 00       	mov    $0x0,%esi
 689:	e9 63 ff ff ff       	jmp    5f1 <printf+0x30>
        printint(fd, *ap, 16, 0);
 68e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 691:	8b 17                	mov    (%edi),%edx
 693:	83 ec 0c             	sub    $0xc,%esp
 696:	6a 00                	push   $0x0
 698:	b9 10 00 00 00       	mov    $0x10,%ecx
 69d:	8b 45 08             	mov    0x8(%ebp),%eax
 6a0:	e8 95 fe ff ff       	call   53a <printint>
        ap++;
 6a5:	83 c7 04             	add    $0x4,%edi
 6a8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ab:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ae:	be 00 00 00 00       	mov    $0x0,%esi
 6b3:	e9 39 ff ff ff       	jmp    5f1 <printf+0x30>
        s = (char*)*ap;
 6b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6bb:	8b 30                	mov    (%eax),%esi
        ap++;
 6bd:	83 c0 04             	add    $0x4,%eax
 6c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6c3:	85 f6                	test   %esi,%esi
 6c5:	75 28                	jne    6ef <printf+0x12e>
          s = "(null)";
 6c7:	be fc 08 00 00       	mov    $0x8fc,%esi
 6cc:	8b 7d 08             	mov    0x8(%ebp),%edi
 6cf:	eb 0d                	jmp    6de <printf+0x11d>
          putc(fd, *s);
 6d1:	0f be d2             	movsbl %dl,%edx
 6d4:	89 f8                	mov    %edi,%eax
 6d6:	e8 45 fe ff ff       	call   520 <putc>
          s++;
 6db:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6de:	0f b6 16             	movzbl (%esi),%edx
 6e1:	84 d2                	test   %dl,%dl
 6e3:	75 ec                	jne    6d1 <printf+0x110>
      state = 0;
 6e5:	be 00 00 00 00       	mov    $0x0,%esi
 6ea:	e9 02 ff ff ff       	jmp    5f1 <printf+0x30>
 6ef:	8b 7d 08             	mov    0x8(%ebp),%edi
 6f2:	eb ea                	jmp    6de <printf+0x11d>
        putc(fd, *ap);
 6f4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f7:	0f be 17             	movsbl (%edi),%edx
 6fa:	8b 45 08             	mov    0x8(%ebp),%eax
 6fd:	e8 1e fe ff ff       	call   520 <putc>
        ap++;
 702:	83 c7 04             	add    $0x4,%edi
 705:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 708:	be 00 00 00 00       	mov    $0x0,%esi
 70d:	e9 df fe ff ff       	jmp    5f1 <printf+0x30>
        putc(fd, c);
 712:	89 fa                	mov    %edi,%edx
 714:	8b 45 08             	mov    0x8(%ebp),%eax
 717:	e8 04 fe ff ff       	call   520 <putc>
      state = 0;
 71c:	be 00 00 00 00       	mov    $0x0,%esi
 721:	e9 cb fe ff ff       	jmp    5f1 <printf+0x30>
    }
  }
}
 726:	8d 65 f4             	lea    -0xc(%ebp),%esp
 729:	5b                   	pop    %ebx
 72a:	5e                   	pop    %esi
 72b:	5f                   	pop    %edi
 72c:	5d                   	pop    %ebp
 72d:	c3                   	ret    

0000072e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72e:	f3 0f 1e fb          	endbr32 
 732:	55                   	push   %ebp
 733:	89 e5                	mov    %esp,%ebp
 735:	57                   	push   %edi
 736:	56                   	push   %esi
 737:	53                   	push   %ebx
 738:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 73b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73e:	a1 0c 0c 00 00       	mov    0xc0c,%eax
 743:	eb 02                	jmp    747 <free+0x19>
 745:	89 d0                	mov    %edx,%eax
 747:	39 c8                	cmp    %ecx,%eax
 749:	73 04                	jae    74f <free+0x21>
 74b:	39 08                	cmp    %ecx,(%eax)
 74d:	77 12                	ja     761 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74f:	8b 10                	mov    (%eax),%edx
 751:	39 c2                	cmp    %eax,%edx
 753:	77 f0                	ja     745 <free+0x17>
 755:	39 c8                	cmp    %ecx,%eax
 757:	72 08                	jb     761 <free+0x33>
 759:	39 ca                	cmp    %ecx,%edx
 75b:	77 04                	ja     761 <free+0x33>
 75d:	89 d0                	mov    %edx,%eax
 75f:	eb e6                	jmp    747 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 761:	8b 73 fc             	mov    -0x4(%ebx),%esi
 764:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 767:	8b 10                	mov    (%eax),%edx
 769:	39 d7                	cmp    %edx,%edi
 76b:	74 19                	je     786 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 76d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 770:	8b 50 04             	mov    0x4(%eax),%edx
 773:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 776:	39 ce                	cmp    %ecx,%esi
 778:	74 1b                	je     795 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 77a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 77c:	a3 0c 0c 00 00       	mov    %eax,0xc0c
}
 781:	5b                   	pop    %ebx
 782:	5e                   	pop    %esi
 783:	5f                   	pop    %edi
 784:	5d                   	pop    %ebp
 785:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 786:	03 72 04             	add    0x4(%edx),%esi
 789:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 78c:	8b 10                	mov    (%eax),%edx
 78e:	8b 12                	mov    (%edx),%edx
 790:	89 53 f8             	mov    %edx,-0x8(%ebx)
 793:	eb db                	jmp    770 <free+0x42>
    p->s.size += bp->s.size;
 795:	03 53 fc             	add    -0x4(%ebx),%edx
 798:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 79b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 79e:	89 10                	mov    %edx,(%eax)
 7a0:	eb da                	jmp    77c <free+0x4e>

000007a2 <morecore>:

static Header*
morecore(uint nu)
{
 7a2:	55                   	push   %ebp
 7a3:	89 e5                	mov    %esp,%ebp
 7a5:	53                   	push   %ebx
 7a6:	83 ec 04             	sub    $0x4,%esp
 7a9:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7ab:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7b0:	77 05                	ja     7b7 <morecore+0x15>
    nu = 4096;
 7b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7b7:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7be:	83 ec 0c             	sub    $0xc,%esp
 7c1:	50                   	push   %eax
 7c2:	e8 01 fd ff ff       	call   4c8 <sbrk>
  if(p == (char*)-1)
 7c7:	83 c4 10             	add    $0x10,%esp
 7ca:	83 f8 ff             	cmp    $0xffffffff,%eax
 7cd:	74 1c                	je     7eb <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7cf:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7d2:	83 c0 08             	add    $0x8,%eax
 7d5:	83 ec 0c             	sub    $0xc,%esp
 7d8:	50                   	push   %eax
 7d9:	e8 50 ff ff ff       	call   72e <free>
  return freep;
 7de:	a1 0c 0c 00 00       	mov    0xc0c,%eax
 7e3:	83 c4 10             	add    $0x10,%esp
}
 7e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7e9:	c9                   	leave  
 7ea:	c3                   	ret    
    return 0;
 7eb:	b8 00 00 00 00       	mov    $0x0,%eax
 7f0:	eb f4                	jmp    7e6 <morecore+0x44>

000007f2 <malloc>:

void*
malloc(uint nbytes)
{
 7f2:	f3 0f 1e fb          	endbr32 
 7f6:	55                   	push   %ebp
 7f7:	89 e5                	mov    %esp,%ebp
 7f9:	53                   	push   %ebx
 7fa:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7fd:	8b 45 08             	mov    0x8(%ebp),%eax
 800:	8d 58 07             	lea    0x7(%eax),%ebx
 803:	c1 eb 03             	shr    $0x3,%ebx
 806:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 809:	8b 0d 0c 0c 00 00    	mov    0xc0c,%ecx
 80f:	85 c9                	test   %ecx,%ecx
 811:	74 04                	je     817 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 813:	8b 01                	mov    (%ecx),%eax
 815:	eb 4b                	jmp    862 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 817:	c7 05 0c 0c 00 00 10 	movl   $0xc10,0xc0c
 81e:	0c 00 00 
 821:	c7 05 10 0c 00 00 10 	movl   $0xc10,0xc10
 828:	0c 00 00 
    base.s.size = 0;
 82b:	c7 05 14 0c 00 00 00 	movl   $0x0,0xc14
 832:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 835:	b9 10 0c 00 00       	mov    $0xc10,%ecx
 83a:	eb d7                	jmp    813 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 83c:	74 1a                	je     858 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 83e:	29 da                	sub    %ebx,%edx
 840:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 843:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 846:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 849:	89 0d 0c 0c 00 00    	mov    %ecx,0xc0c
      return (void*)(p + 1);
 84f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 852:	83 c4 04             	add    $0x4,%esp
 855:	5b                   	pop    %ebx
 856:	5d                   	pop    %ebp
 857:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 858:	8b 10                	mov    (%eax),%edx
 85a:	89 11                	mov    %edx,(%ecx)
 85c:	eb eb                	jmp    849 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85e:	89 c1                	mov    %eax,%ecx
 860:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 862:	8b 50 04             	mov    0x4(%eax),%edx
 865:	39 da                	cmp    %ebx,%edx
 867:	73 d3                	jae    83c <malloc+0x4a>
    if(p == freep)
 869:	39 05 0c 0c 00 00    	cmp    %eax,0xc0c
 86f:	75 ed                	jne    85e <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 871:	89 d8                	mov    %ebx,%eax
 873:	e8 2a ff ff ff       	call   7a2 <morecore>
 878:	85 c0                	test   %eax,%eax
 87a:	75 e2                	jne    85e <malloc+0x6c>
 87c:	eb d4                	jmp    852 <malloc+0x60>
