
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  1a:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  21:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  28:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2e:	68 f4 07 00 00       	push   $0x7f4
  33:	6a 01                	push   $0x1
  35:	e8 fd 04 00 00       	call   537 <printf>
  memset(data, 'a', sizeof(data));
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 00 02 00 00       	push   $0x200
  42:	6a 61                	push   $0x61
  44:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  4a:	50                   	push   %eax
  4b:	e8 40 01 00 00       	call   190 <memset>

  for(i = 0; i < 4; i++)
  50:	83 c4 10             	add    $0x10,%esp
  53:	bb 00 00 00 00       	mov    $0x0,%ebx
  58:	83 fb 03             	cmp    $0x3,%ebx
  5b:	7f 0e                	jg     6b <main+0x6b>
    if(fork() > 0)
  5d:	e8 4c 03 00 00       	call   3ae <fork>
  62:	85 c0                	test   %eax,%eax
  64:	7f 05                	jg     6b <main+0x6b>
  for(i = 0; i < 4; i++)
  66:	83 c3 01             	add    $0x1,%ebx
  69:	eb ed                	jmp    58 <main+0x58>
      break;

  printf(1, "write %d\n", i);
  6b:	83 ec 04             	sub    $0x4,%esp
  6e:	53                   	push   %ebx
  6f:	68 07 08 00 00       	push   $0x807
  74:	6a 01                	push   $0x1
  76:	e8 bc 04 00 00       	call   537 <printf>

  path[8] += i;
  7b:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7e:	83 c4 08             	add    $0x8,%esp
  81:	68 02 02 00 00       	push   $0x202
  86:	8d 45 de             	lea    -0x22(%ebp),%eax
  89:	50                   	push   %eax
  8a:	e8 67 03 00 00       	call   3f6 <open>
  8f:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  91:	83 c4 10             	add    $0x10,%esp
  94:	bb 00 00 00 00       	mov    $0x0,%ebx
  99:	eb 1b                	jmp    b6 <main+0xb6>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  9b:	83 ec 04             	sub    $0x4,%esp
  9e:	68 00 02 00 00       	push   $0x200
  a3:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a9:	50                   	push   %eax
  aa:	56                   	push   %esi
  ab:	e8 26 03 00 00       	call   3d6 <write>
  for(i = 0; i < 20; i++)
  b0:	83 c3 01             	add    $0x1,%ebx
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	83 fb 13             	cmp    $0x13,%ebx
  b9:	7e e0                	jle    9b <main+0x9b>
  close(fd);
  bb:	83 ec 0c             	sub    $0xc,%esp
  be:	56                   	push   %esi
  bf:	e8 1a 03 00 00       	call   3de <close>

  printf(1, "read\n");
  c4:	83 c4 08             	add    $0x8,%esp
  c7:	68 11 08 00 00       	push   $0x811
  cc:	6a 01                	push   $0x1
  ce:	e8 64 04 00 00       	call   537 <printf>

  fd = open(path, O_RDONLY);
  d3:	83 c4 08             	add    $0x8,%esp
  d6:	6a 00                	push   $0x0
  d8:	8d 45 de             	lea    -0x22(%ebp),%eax
  db:	50                   	push   %eax
  dc:	e8 15 03 00 00       	call   3f6 <open>
  e1:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  e3:	83 c4 10             	add    $0x10,%esp
  e6:	bb 00 00 00 00       	mov    $0x0,%ebx
  eb:	eb 1b                	jmp    108 <main+0x108>
    read(fd, data, sizeof(data));
  ed:	83 ec 04             	sub    $0x4,%esp
  f0:	68 00 02 00 00       	push   $0x200
  f5:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  fb:	50                   	push   %eax
  fc:	56                   	push   %esi
  fd:	e8 cc 02 00 00       	call   3ce <read>
  for (i = 0; i < 20; i++)
 102:	83 c3 01             	add    $0x1,%ebx
 105:	83 c4 10             	add    $0x10,%esp
 108:	83 fb 13             	cmp    $0x13,%ebx
 10b:	7e e0                	jle    ed <main+0xed>
  close(fd);
 10d:	83 ec 0c             	sub    $0xc,%esp
 110:	56                   	push   %esi
 111:	e8 c8 02 00 00       	call   3de <close>

  wait();
 116:	e8 a3 02 00 00       	call   3be <wait>

  exit();
 11b:	e8 96 02 00 00       	call   3b6 <exit>

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	56                   	push   %esi
 128:	53                   	push   %ebx
 129:	8b 75 08             	mov    0x8(%ebp),%esi
 12c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 12f:	89 f0                	mov    %esi,%eax
 131:	89 d1                	mov    %edx,%ecx
 133:	83 c2 01             	add    $0x1,%edx
 136:	89 c3                	mov    %eax,%ebx
 138:	83 c0 01             	add    $0x1,%eax
 13b:	0f b6 09             	movzbl (%ecx),%ecx
 13e:	88 0b                	mov    %cl,(%ebx)
 140:	84 c9                	test   %cl,%cl
 142:	75 ed                	jne    131 <strcpy+0x11>
    ;
  return os;
}
 144:	89 f0                	mov    %esi,%eax
 146:	5b                   	pop    %ebx
 147:	5e                   	pop    %esi
 148:	5d                   	pop    %ebp
 149:	c3                   	ret    

0000014a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 14a:	f3 0f 1e fb          	endbr32 
 14e:	55                   	push   %ebp
 14f:	89 e5                	mov    %esp,%ebp
 151:	8b 4d 08             	mov    0x8(%ebp),%ecx
 154:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 157:	0f b6 01             	movzbl (%ecx),%eax
 15a:	84 c0                	test   %al,%al
 15c:	74 0c                	je     16a <strcmp+0x20>
 15e:	3a 02                	cmp    (%edx),%al
 160:	75 08                	jne    16a <strcmp+0x20>
    p++, q++;
 162:	83 c1 01             	add    $0x1,%ecx
 165:	83 c2 01             	add    $0x1,%edx
 168:	eb ed                	jmp    157 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 16a:	0f b6 c0             	movzbl %al,%eax
 16d:	0f b6 12             	movzbl (%edx),%edx
 170:	29 d0                	sub    %edx,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    

00000174 <strlen>:

uint
strlen(char *s)
{
 174:	f3 0f 1e fb          	endbr32 
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 17e:	b8 00 00 00 00       	mov    $0x0,%eax
 183:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 187:	74 05                	je     18e <strlen+0x1a>
 189:	83 c0 01             	add    $0x1,%eax
 18c:	eb f5                	jmp    183 <strlen+0xf>
    ;
  return n;
}
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    

00000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	57                   	push   %edi
 198:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 19b:	89 d7                	mov    %edx,%edi
 19d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a3:	fc                   	cld    
 1a4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1a6:	89 d0                	mov    %edx,%eax
 1a8:	5f                   	pop    %edi
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    

000001ab <strchr>:

char*
strchr(const char *s, char c)
{
 1ab:	f3 0f 1e fb          	endbr32 
 1af:	55                   	push   %ebp
 1b0:	89 e5                	mov    %esp,%ebp
 1b2:	8b 45 08             	mov    0x8(%ebp),%eax
 1b5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1b9:	0f b6 10             	movzbl (%eax),%edx
 1bc:	84 d2                	test   %dl,%dl
 1be:	74 09                	je     1c9 <strchr+0x1e>
    if(*s == c)
 1c0:	38 ca                	cmp    %cl,%dl
 1c2:	74 0a                	je     1ce <strchr+0x23>
  for(; *s; s++)
 1c4:	83 c0 01             	add    $0x1,%eax
 1c7:	eb f0                	jmp    1b9 <strchr+0xe>
      return (char*)s;
  return 0;
 1c9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    

000001d0 <gets>:

char*
gets(char *buf, int max)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	56                   	push   %esi
 1d9:	53                   	push   %ebx
 1da:	83 ec 1c             	sub    $0x1c,%esp
 1dd:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e0:	bb 00 00 00 00       	mov    $0x0,%ebx
 1e5:	89 de                	mov    %ebx,%esi
 1e7:	83 c3 01             	add    $0x1,%ebx
 1ea:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ed:	7d 2e                	jge    21d <gets+0x4d>
    cc = read(0, &c, 1);
 1ef:	83 ec 04             	sub    $0x4,%esp
 1f2:	6a 01                	push   $0x1
 1f4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1f7:	50                   	push   %eax
 1f8:	6a 00                	push   $0x0
 1fa:	e8 cf 01 00 00       	call   3ce <read>
    if(cc < 1)
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	85 c0                	test   %eax,%eax
 204:	7e 17                	jle    21d <gets+0x4d>
      break;
    buf[i++] = c;
 206:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 20a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 20d:	3c 0a                	cmp    $0xa,%al
 20f:	0f 94 c2             	sete   %dl
 212:	3c 0d                	cmp    $0xd,%al
 214:	0f 94 c0             	sete   %al
 217:	08 c2                	or     %al,%dl
 219:	74 ca                	je     1e5 <gets+0x15>
    buf[i++] = c;
 21b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 21d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 221:	89 f8                	mov    %edi,%eax
 223:	8d 65 f4             	lea    -0xc(%ebp),%esp
 226:	5b                   	pop    %ebx
 227:	5e                   	pop    %esi
 228:	5f                   	pop    %edi
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    

0000022b <stat>:

int
stat(char *n, struct stat *st)
{
 22b:	f3 0f 1e fb          	endbr32 
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
 232:	56                   	push   %esi
 233:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 234:	83 ec 08             	sub    $0x8,%esp
 237:	6a 00                	push   $0x0
 239:	ff 75 08             	pushl  0x8(%ebp)
 23c:	e8 b5 01 00 00       	call   3f6 <open>
  if(fd < 0)
 241:	83 c4 10             	add    $0x10,%esp
 244:	85 c0                	test   %eax,%eax
 246:	78 24                	js     26c <stat+0x41>
 248:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 24a:	83 ec 08             	sub    $0x8,%esp
 24d:	ff 75 0c             	pushl  0xc(%ebp)
 250:	50                   	push   %eax
 251:	e8 b8 01 00 00       	call   40e <fstat>
 256:	89 c6                	mov    %eax,%esi
  close(fd);
 258:	89 1c 24             	mov    %ebx,(%esp)
 25b:	e8 7e 01 00 00       	call   3de <close>
  return r;
 260:	83 c4 10             	add    $0x10,%esp
}
 263:	89 f0                	mov    %esi,%eax
 265:	8d 65 f8             	lea    -0x8(%ebp),%esp
 268:	5b                   	pop    %ebx
 269:	5e                   	pop    %esi
 26a:	5d                   	pop    %ebp
 26b:	c3                   	ret    
    return -1;
 26c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 271:	eb f0                	jmp    263 <stat+0x38>

00000273 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 273:	f3 0f 1e fb          	endbr32 
 277:	55                   	push   %ebp
 278:	89 e5                	mov    %esp,%ebp
 27a:	57                   	push   %edi
 27b:	56                   	push   %esi
 27c:	53                   	push   %ebx
 27d:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 280:	0f b6 02             	movzbl (%edx),%eax
 283:	3c 20                	cmp    $0x20,%al
 285:	75 05                	jne    28c <atoi+0x19>
 287:	83 c2 01             	add    $0x1,%edx
 28a:	eb f4                	jmp    280 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 28c:	3c 2d                	cmp    $0x2d,%al
 28e:	74 1d                	je     2ad <atoi+0x3a>
 290:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 295:	3c 2b                	cmp    $0x2b,%al
 297:	0f 94 c1             	sete   %cl
 29a:	3c 2d                	cmp    $0x2d,%al
 29c:	0f 94 c0             	sete   %al
 29f:	08 c1                	or     %al,%cl
 2a1:	74 03                	je     2a6 <atoi+0x33>
    s++;
 2a3:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 2a6:	b8 00 00 00 00       	mov    $0x0,%eax
 2ab:	eb 17                	jmp    2c4 <atoi+0x51>
 2ad:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 2b2:	eb e1                	jmp    295 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 2b4:	8d 34 80             	lea    (%eax,%eax,4),%esi
 2b7:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 2ba:	83 c2 01             	add    $0x1,%edx
 2bd:	0f be c9             	movsbl %cl,%ecx
 2c0:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 2c4:	0f b6 0a             	movzbl (%edx),%ecx
 2c7:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 2ca:	80 fb 09             	cmp    $0x9,%bl
 2cd:	76 e5                	jbe    2b4 <atoi+0x41>
  return sign*n;
 2cf:	0f af c7             	imul   %edi,%eax
}
 2d2:	5b                   	pop    %ebx
 2d3:	5e                   	pop    %esi
 2d4:	5f                   	pop    %edi
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret    

000002d7 <atoo>:

int
atoo(const char *s)
{
 2d7:	f3 0f 1e fb          	endbr32 
 2db:	55                   	push   %ebp
 2dc:	89 e5                	mov    %esp,%ebp
 2de:	57                   	push   %edi
 2df:	56                   	push   %esi
 2e0:	53                   	push   %ebx
 2e1:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 2e4:	0f b6 0a             	movzbl (%edx),%ecx
 2e7:	80 f9 20             	cmp    $0x20,%cl
 2ea:	75 05                	jne    2f1 <atoo+0x1a>
 2ec:	83 c2 01             	add    $0x1,%edx
 2ef:	eb f3                	jmp    2e4 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 2f1:	80 f9 2d             	cmp    $0x2d,%cl
 2f4:	74 23                	je     319 <atoo+0x42>
 2f6:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 2fb:	80 f9 2b             	cmp    $0x2b,%cl
 2fe:	0f 94 c0             	sete   %al
 301:	89 c6                	mov    %eax,%esi
 303:	80 f9 2d             	cmp    $0x2d,%cl
 306:	0f 94 c0             	sete   %al
 309:	89 f3                	mov    %esi,%ebx
 30b:	08 c3                	or     %al,%bl
 30d:	74 03                	je     312 <atoo+0x3b>
    s++;
 30f:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 312:	b8 00 00 00 00       	mov    $0x0,%eax
 317:	eb 11                	jmp    32a <atoo+0x53>
 319:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 31e:	eb db                	jmp    2fb <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	0f be c9             	movsbl %cl,%ecx
 326:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 32a:	0f b6 0a             	movzbl (%edx),%ecx
 32d:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 330:	80 fb 07             	cmp    $0x7,%bl
 333:	76 eb                	jbe    320 <atoo+0x49>
  return sign*n;
 335:	0f af c7             	imul   %edi,%eax
}
 338:	5b                   	pop    %ebx
 339:	5e                   	pop    %esi
 33a:	5f                   	pop    %edi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    

0000033d <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 33d:	f3 0f 1e fb          	endbr32 
 341:	55                   	push   %ebp
 342:	89 e5                	mov    %esp,%ebp
 344:	53                   	push   %ebx
 345:	8b 55 08             	mov    0x8(%ebp),%edx
 348:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 34b:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 34e:	eb 09                	jmp    359 <strncmp+0x1c>
      n--, p++, q++;
 350:	83 e8 01             	sub    $0x1,%eax
 353:	83 c2 01             	add    $0x1,%edx
 356:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 359:	85 c0                	test   %eax,%eax
 35b:	74 0b                	je     368 <strncmp+0x2b>
 35d:	0f b6 1a             	movzbl (%edx),%ebx
 360:	84 db                	test   %bl,%bl
 362:	74 04                	je     368 <strncmp+0x2b>
 364:	3a 19                	cmp    (%ecx),%bl
 366:	74 e8                	je     350 <strncmp+0x13>
    if(n == 0)
 368:	85 c0                	test   %eax,%eax
 36a:	74 0b                	je     377 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 36c:	0f b6 02             	movzbl (%edx),%eax
 36f:	0f b6 11             	movzbl (%ecx),%edx
 372:	29 d0                	sub    %edx,%eax
}
 374:	5b                   	pop    %ebx
 375:	5d                   	pop    %ebp
 376:	c3                   	ret    
      return 0;
 377:	b8 00 00 00 00       	mov    $0x0,%eax
 37c:	eb f6                	jmp    374 <strncmp+0x37>

0000037e <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 37e:	f3 0f 1e fb          	endbr32 
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	56                   	push   %esi
 386:	53                   	push   %ebx
 387:	8b 75 08             	mov    0x8(%ebp),%esi
 38a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 38d:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 390:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 392:	8d 58 ff             	lea    -0x1(%eax),%ebx
 395:	85 c0                	test   %eax,%eax
 397:	7e 0f                	jle    3a8 <memmove+0x2a>
    *dst++ = *src++;
 399:	0f b6 01             	movzbl (%ecx),%eax
 39c:	88 02                	mov    %al,(%edx)
 39e:	8d 49 01             	lea    0x1(%ecx),%ecx
 3a1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3a4:	89 d8                	mov    %ebx,%eax
 3a6:	eb ea                	jmp    392 <memmove+0x14>
  return vdst;
}
 3a8:	89 f0                	mov    %esi,%eax
 3aa:	5b                   	pop    %ebx
 3ab:	5e                   	pop    %esi
 3ac:	5d                   	pop    %ebp
 3ad:	c3                   	ret    

000003ae <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ae:	b8 01 00 00 00       	mov    $0x1,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <exit>:
SYSCALL(exit)
 3b6:	b8 02 00 00 00       	mov    $0x2,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <wait>:
SYSCALL(wait)
 3be:	b8 03 00 00 00       	mov    $0x3,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <pipe>:
SYSCALL(pipe)
 3c6:	b8 04 00 00 00       	mov    $0x4,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <read>:
SYSCALL(read)
 3ce:	b8 05 00 00 00       	mov    $0x5,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <write>:
SYSCALL(write)
 3d6:	b8 10 00 00 00       	mov    $0x10,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <close>:
SYSCALL(close)
 3de:	b8 15 00 00 00       	mov    $0x15,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <kill>:
SYSCALL(kill)
 3e6:	b8 06 00 00 00       	mov    $0x6,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <exec>:
SYSCALL(exec)
 3ee:	b8 07 00 00 00       	mov    $0x7,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <open>:
SYSCALL(open)
 3f6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <mknod>:
SYSCALL(mknod)
 3fe:	b8 11 00 00 00       	mov    $0x11,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <unlink>:
SYSCALL(unlink)
 406:	b8 12 00 00 00       	mov    $0x12,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <fstat>:
SYSCALL(fstat)
 40e:	b8 08 00 00 00       	mov    $0x8,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <link>:
SYSCALL(link)
 416:	b8 13 00 00 00       	mov    $0x13,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <mkdir>:
SYSCALL(mkdir)
 41e:	b8 14 00 00 00       	mov    $0x14,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <chdir>:
SYSCALL(chdir)
 426:	b8 09 00 00 00       	mov    $0x9,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <dup>:
SYSCALL(dup)
 42e:	b8 0a 00 00 00       	mov    $0xa,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <getpid>:
SYSCALL(getpid)
 436:	b8 0b 00 00 00       	mov    $0xb,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <sbrk>:
SYSCALL(sbrk)
 43e:	b8 0c 00 00 00       	mov    $0xc,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <sleep>:
SYSCALL(sleep)
 446:	b8 0d 00 00 00       	mov    $0xd,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <uptime>:
SYSCALL(uptime)
 44e:	b8 0e 00 00 00       	mov    $0xe,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <halt>:
SYSCALL(halt)
 456:	b8 16 00 00 00       	mov    $0x16,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <date>:
SYSCALL(date)
 45e:	b8 17 00 00 00       	mov    $0x17,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <getuid>:
SYSCALL(getuid)
 466:	b8 18 00 00 00       	mov    $0x18,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <getgid>:
SYSCALL(getgid)
 46e:	b8 19 00 00 00       	mov    $0x19,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <getppid>:
SYSCALL(getppid)
 476:	b8 1a 00 00 00       	mov    $0x1a,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <setuid>:
SYSCALL(setuid)
 47e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <setgid>:
SYSCALL(setgid)
 486:	b8 1c 00 00 00       	mov    $0x1c,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <getprocs>:
 48e:	b8 1d 00 00 00       	mov    $0x1d,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 496:	55                   	push   %ebp
 497:	89 e5                	mov    %esp,%ebp
 499:	83 ec 1c             	sub    $0x1c,%esp
 49c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 49f:	6a 01                	push   $0x1
 4a1:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4a4:	52                   	push   %edx
 4a5:	50                   	push   %eax
 4a6:	e8 2b ff ff ff       	call   3d6 <write>
}
 4ab:	83 c4 10             	add    $0x10,%esp
 4ae:	c9                   	leave  
 4af:	c3                   	ret    

000004b0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 2c             	sub    $0x2c,%esp
 4b9:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4bc:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4be:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4c2:	0f 95 c2             	setne  %dl
 4c5:	89 f0                	mov    %esi,%eax
 4c7:	c1 e8 1f             	shr    $0x1f,%eax
 4ca:	84 c2                	test   %al,%dl
 4cc:	74 42                	je     510 <printint+0x60>
    neg = 1;
    x = -xx;
 4ce:	f7 de                	neg    %esi
    neg = 1;
 4d0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4d7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4dc:	89 f0                	mov    %esi,%eax
 4de:	ba 00 00 00 00       	mov    $0x0,%edx
 4e3:	f7 f1                	div    %ecx
 4e5:	89 df                	mov    %ebx,%edi
 4e7:	83 c3 01             	add    $0x1,%ebx
 4ea:	0f b6 92 20 08 00 00 	movzbl 0x820(%edx),%edx
 4f1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4f5:	89 f2                	mov    %esi,%edx
 4f7:	89 c6                	mov    %eax,%esi
 4f9:	39 d1                	cmp    %edx,%ecx
 4fb:	76 df                	jbe    4dc <printint+0x2c>
  if(neg)
 4fd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 501:	74 2f                	je     532 <printint+0x82>
    buf[i++] = '-';
 503:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 508:	8d 5f 02             	lea    0x2(%edi),%ebx
 50b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 50e:	eb 15                	jmp    525 <printint+0x75>
  neg = 0;
 510:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 517:	eb be                	jmp    4d7 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 519:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 51e:	89 f0                	mov    %esi,%eax
 520:	e8 71 ff ff ff       	call   496 <putc>
  while(--i >= 0)
 525:	83 eb 01             	sub    $0x1,%ebx
 528:	79 ef                	jns    519 <printint+0x69>
}
 52a:	83 c4 2c             	add    $0x2c,%esp
 52d:	5b                   	pop    %ebx
 52e:	5e                   	pop    %esi
 52f:	5f                   	pop    %edi
 530:	5d                   	pop    %ebp
 531:	c3                   	ret    
 532:	8b 75 d0             	mov    -0x30(%ebp),%esi
 535:	eb ee                	jmp    525 <printint+0x75>

00000537 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 537:	f3 0f 1e fb          	endbr32 
 53b:	55                   	push   %ebp
 53c:	89 e5                	mov    %esp,%ebp
 53e:	57                   	push   %edi
 53f:	56                   	push   %esi
 540:	53                   	push   %ebx
 541:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 544:	8d 45 10             	lea    0x10(%ebp),%eax
 547:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 54a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 54f:	bb 00 00 00 00       	mov    $0x0,%ebx
 554:	eb 14                	jmp    56a <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 556:	89 fa                	mov    %edi,%edx
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	e8 36 ff ff ff       	call   496 <putc>
 560:	eb 05                	jmp    567 <printf+0x30>
      }
    } else if(state == '%'){
 562:	83 fe 25             	cmp    $0x25,%esi
 565:	74 25                	je     58c <printf+0x55>
  for(i = 0; fmt[i]; i++){
 567:	83 c3 01             	add    $0x1,%ebx
 56a:	8b 45 0c             	mov    0xc(%ebp),%eax
 56d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 571:	84 c0                	test   %al,%al
 573:	0f 84 23 01 00 00    	je     69c <printf+0x165>
    c = fmt[i] & 0xff;
 579:	0f be f8             	movsbl %al,%edi
 57c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 57f:	85 f6                	test   %esi,%esi
 581:	75 df                	jne    562 <printf+0x2b>
      if(c == '%'){
 583:	83 f8 25             	cmp    $0x25,%eax
 586:	75 ce                	jne    556 <printf+0x1f>
        state = '%';
 588:	89 c6                	mov    %eax,%esi
 58a:	eb db                	jmp    567 <printf+0x30>
      if(c == 'd'){
 58c:	83 f8 64             	cmp    $0x64,%eax
 58f:	74 49                	je     5da <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 591:	83 f8 78             	cmp    $0x78,%eax
 594:	0f 94 c1             	sete   %cl
 597:	83 f8 70             	cmp    $0x70,%eax
 59a:	0f 94 c2             	sete   %dl
 59d:	08 d1                	or     %dl,%cl
 59f:	75 63                	jne    604 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5a1:	83 f8 73             	cmp    $0x73,%eax
 5a4:	0f 84 84 00 00 00    	je     62e <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5aa:	83 f8 63             	cmp    $0x63,%eax
 5ad:	0f 84 b7 00 00 00    	je     66a <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5b3:	83 f8 25             	cmp    $0x25,%eax
 5b6:	0f 84 cc 00 00 00    	je     688 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5bc:	ba 25 00 00 00       	mov    $0x25,%edx
 5c1:	8b 45 08             	mov    0x8(%ebp),%eax
 5c4:	e8 cd fe ff ff       	call   496 <putc>
        putc(fd, c);
 5c9:	89 fa                	mov    %edi,%edx
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	e8 c3 fe ff ff       	call   496 <putc>
      }
      state = 0;
 5d3:	be 00 00 00 00       	mov    $0x0,%esi
 5d8:	eb 8d                	jmp    567 <printf+0x30>
        printint(fd, *ap, 10, 1);
 5da:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5dd:	8b 17                	mov    (%edi),%edx
 5df:	83 ec 0c             	sub    $0xc,%esp
 5e2:	6a 01                	push   $0x1
 5e4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5e9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ec:	e8 bf fe ff ff       	call   4b0 <printint>
        ap++;
 5f1:	83 c7 04             	add    $0x4,%edi
 5f4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5f7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5fa:	be 00 00 00 00       	mov    $0x0,%esi
 5ff:	e9 63 ff ff ff       	jmp    567 <printf+0x30>
        printint(fd, *ap, 16, 0);
 604:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 607:	8b 17                	mov    (%edi),%edx
 609:	83 ec 0c             	sub    $0xc,%esp
 60c:	6a 00                	push   $0x0
 60e:	b9 10 00 00 00       	mov    $0x10,%ecx
 613:	8b 45 08             	mov    0x8(%ebp),%eax
 616:	e8 95 fe ff ff       	call   4b0 <printint>
        ap++;
 61b:	83 c7 04             	add    $0x4,%edi
 61e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 621:	83 c4 10             	add    $0x10,%esp
      state = 0;
 624:	be 00 00 00 00       	mov    $0x0,%esi
 629:	e9 39 ff ff ff       	jmp    567 <printf+0x30>
        s = (char*)*ap;
 62e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 631:	8b 30                	mov    (%eax),%esi
        ap++;
 633:	83 c0 04             	add    $0x4,%eax
 636:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 639:	85 f6                	test   %esi,%esi
 63b:	75 28                	jne    665 <printf+0x12e>
          s = "(null)";
 63d:	be 17 08 00 00       	mov    $0x817,%esi
 642:	8b 7d 08             	mov    0x8(%ebp),%edi
 645:	eb 0d                	jmp    654 <printf+0x11d>
          putc(fd, *s);
 647:	0f be d2             	movsbl %dl,%edx
 64a:	89 f8                	mov    %edi,%eax
 64c:	e8 45 fe ff ff       	call   496 <putc>
          s++;
 651:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 654:	0f b6 16             	movzbl (%esi),%edx
 657:	84 d2                	test   %dl,%dl
 659:	75 ec                	jne    647 <printf+0x110>
      state = 0;
 65b:	be 00 00 00 00       	mov    $0x0,%esi
 660:	e9 02 ff ff ff       	jmp    567 <printf+0x30>
 665:	8b 7d 08             	mov    0x8(%ebp),%edi
 668:	eb ea                	jmp    654 <printf+0x11d>
        putc(fd, *ap);
 66a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 66d:	0f be 17             	movsbl (%edi),%edx
 670:	8b 45 08             	mov    0x8(%ebp),%eax
 673:	e8 1e fe ff ff       	call   496 <putc>
        ap++;
 678:	83 c7 04             	add    $0x4,%edi
 67b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 67e:	be 00 00 00 00       	mov    $0x0,%esi
 683:	e9 df fe ff ff       	jmp    567 <printf+0x30>
        putc(fd, c);
 688:	89 fa                	mov    %edi,%edx
 68a:	8b 45 08             	mov    0x8(%ebp),%eax
 68d:	e8 04 fe ff ff       	call   496 <putc>
      state = 0;
 692:	be 00 00 00 00       	mov    $0x0,%esi
 697:	e9 cb fe ff ff       	jmp    567 <printf+0x30>
    }
  }
}
 69c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 69f:	5b                   	pop    %ebx
 6a0:	5e                   	pop    %esi
 6a1:	5f                   	pop    %edi
 6a2:	5d                   	pop    %ebp
 6a3:	c3                   	ret    

000006a4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a4:	f3 0f 1e fb          	endbr32 
 6a8:	55                   	push   %ebp
 6a9:	89 e5                	mov    %esp,%ebp
 6ab:	57                   	push   %edi
 6ac:	56                   	push   %esi
 6ad:	53                   	push   %ebx
 6ae:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6b1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b4:	a1 24 0b 00 00       	mov    0xb24,%eax
 6b9:	eb 02                	jmp    6bd <free+0x19>
 6bb:	89 d0                	mov    %edx,%eax
 6bd:	39 c8                	cmp    %ecx,%eax
 6bf:	73 04                	jae    6c5 <free+0x21>
 6c1:	39 08                	cmp    %ecx,(%eax)
 6c3:	77 12                	ja     6d7 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c5:	8b 10                	mov    (%eax),%edx
 6c7:	39 c2                	cmp    %eax,%edx
 6c9:	77 f0                	ja     6bb <free+0x17>
 6cb:	39 c8                	cmp    %ecx,%eax
 6cd:	72 08                	jb     6d7 <free+0x33>
 6cf:	39 ca                	cmp    %ecx,%edx
 6d1:	77 04                	ja     6d7 <free+0x33>
 6d3:	89 d0                	mov    %edx,%eax
 6d5:	eb e6                	jmp    6bd <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6da:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6dd:	8b 10                	mov    (%eax),%edx
 6df:	39 d7                	cmp    %edx,%edi
 6e1:	74 19                	je     6fc <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6e3:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6e6:	8b 50 04             	mov    0x4(%eax),%edx
 6e9:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6ec:	39 ce                	cmp    %ecx,%esi
 6ee:	74 1b                	je     70b <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6f0:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6f2:	a3 24 0b 00 00       	mov    %eax,0xb24
}
 6f7:	5b                   	pop    %ebx
 6f8:	5e                   	pop    %esi
 6f9:	5f                   	pop    %edi
 6fa:	5d                   	pop    %ebp
 6fb:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6fc:	03 72 04             	add    0x4(%edx),%esi
 6ff:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 702:	8b 10                	mov    (%eax),%edx
 704:	8b 12                	mov    (%edx),%edx
 706:	89 53 f8             	mov    %edx,-0x8(%ebx)
 709:	eb db                	jmp    6e6 <free+0x42>
    p->s.size += bp->s.size;
 70b:	03 53 fc             	add    -0x4(%ebx),%edx
 70e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 711:	8b 53 f8             	mov    -0x8(%ebx),%edx
 714:	89 10                	mov    %edx,(%eax)
 716:	eb da                	jmp    6f2 <free+0x4e>

00000718 <morecore>:

static Header*
morecore(uint nu)
{
 718:	55                   	push   %ebp
 719:	89 e5                	mov    %esp,%ebp
 71b:	53                   	push   %ebx
 71c:	83 ec 04             	sub    $0x4,%esp
 71f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 721:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 726:	77 05                	ja     72d <morecore+0x15>
    nu = 4096;
 728:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 72d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 734:	83 ec 0c             	sub    $0xc,%esp
 737:	50                   	push   %eax
 738:	e8 01 fd ff ff       	call   43e <sbrk>
  if(p == (char*)-1)
 73d:	83 c4 10             	add    $0x10,%esp
 740:	83 f8 ff             	cmp    $0xffffffff,%eax
 743:	74 1c                	je     761 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 745:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 748:	83 c0 08             	add    $0x8,%eax
 74b:	83 ec 0c             	sub    $0xc,%esp
 74e:	50                   	push   %eax
 74f:	e8 50 ff ff ff       	call   6a4 <free>
  return freep;
 754:	a1 24 0b 00 00       	mov    0xb24,%eax
 759:	83 c4 10             	add    $0x10,%esp
}
 75c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 75f:	c9                   	leave  
 760:	c3                   	ret    
    return 0;
 761:	b8 00 00 00 00       	mov    $0x0,%eax
 766:	eb f4                	jmp    75c <morecore+0x44>

00000768 <malloc>:

void*
malloc(uint nbytes)
{
 768:	f3 0f 1e fb          	endbr32 
 76c:	55                   	push   %ebp
 76d:	89 e5                	mov    %esp,%ebp
 76f:	53                   	push   %ebx
 770:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 773:	8b 45 08             	mov    0x8(%ebp),%eax
 776:	8d 58 07             	lea    0x7(%eax),%ebx
 779:	c1 eb 03             	shr    $0x3,%ebx
 77c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 77f:	8b 0d 24 0b 00 00    	mov    0xb24,%ecx
 785:	85 c9                	test   %ecx,%ecx
 787:	74 04                	je     78d <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 789:	8b 01                	mov    (%ecx),%eax
 78b:	eb 4b                	jmp    7d8 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 78d:	c7 05 24 0b 00 00 28 	movl   $0xb28,0xb24
 794:	0b 00 00 
 797:	c7 05 28 0b 00 00 28 	movl   $0xb28,0xb28
 79e:	0b 00 00 
    base.s.size = 0;
 7a1:	c7 05 2c 0b 00 00 00 	movl   $0x0,0xb2c
 7a8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7ab:	b9 28 0b 00 00       	mov    $0xb28,%ecx
 7b0:	eb d7                	jmp    789 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7b2:	74 1a                	je     7ce <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7b4:	29 da                	sub    %ebx,%edx
 7b6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7b9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7bc:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7bf:	89 0d 24 0b 00 00    	mov    %ecx,0xb24
      return (void*)(p + 1);
 7c5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7c8:	83 c4 04             	add    $0x4,%esp
 7cb:	5b                   	pop    %ebx
 7cc:	5d                   	pop    %ebp
 7cd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7ce:	8b 10                	mov    (%eax),%edx
 7d0:	89 11                	mov    %edx,(%ecx)
 7d2:	eb eb                	jmp    7bf <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d4:	89 c1                	mov    %eax,%ecx
 7d6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7d8:	8b 50 04             	mov    0x4(%eax),%edx
 7db:	39 da                	cmp    %ebx,%edx
 7dd:	73 d3                	jae    7b2 <malloc+0x4a>
    if(p == freep)
 7df:	39 05 24 0b 00 00    	cmp    %eax,0xb24
 7e5:	75 ed                	jne    7d4 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 7e7:	89 d8                	mov    %ebx,%eax
 7e9:	e8 2a ff ff ff       	call   718 <morecore>
 7ee:	85 c0                	test   %eax,%eax
 7f0:	75 e2                	jne    7d4 <malloc+0x6c>
 7f2:	eb d4                	jmp    7c8 <malloc+0x60>
