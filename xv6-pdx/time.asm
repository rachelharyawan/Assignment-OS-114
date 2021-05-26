
_time:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main(int argc, char* argv[])
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
  15:	83 ec 08             	sub    $0x8,%esp
  18:	8b 59 04             	mov    0x4(%ecx),%ebx
    int t1 = 0, t2 = 0, elapsed = 0, decimal = 0, pid = 0;
    if(argc < 2)
  1b:	83 39 01             	cmpl   $0x1,(%ecx)
  1e:	7e 35                	jle    55 <main+0x55>
      printf(1, "(null) ran in 0.000 seconds\n");
    else {
        ++argv;
  20:	8d 7b 04             	lea    0x4(%ebx),%edi
        t1 = uptime();
  23:	e8 f6 03 00 00       	call   41e <uptime>
  28:	89 c6                	mov    %eax,%esi
        pid = fork();
  2a:	e8 4f 03 00 00       	call   37e <fork>
        if(pid < 0) {
  2f:	85 c0                	test   %eax,%eax
  31:	78 39                	js     6c <main+0x6c>
            printf(1, "Ran in 0.000 seconds\n");
            exit();
        }
        else if(pid == 0) {
  33:	75 4b                	jne    80 <main+0x80>
            exec(argv[0], argv);
  35:	83 ec 08             	sub    $0x8,%esp
  38:	57                   	push   %edi
  39:	ff 73 04             	pushl  0x4(%ebx)
  3c:	e8 7d 03 00 00       	call   3be <exec>
            printf(1, "Error: No such command\n");
  41:	83 c4 08             	add    $0x8,%esp
  44:	68 f7 07 00 00       	push   $0x7f7
  49:	6a 01                	push   $0x1
  4b:	e8 b7 04 00 00       	call   507 <printf>
  50:	83 c4 10             	add    $0x10,%esp
  53:	eb 12                	jmp    67 <main+0x67>
      printf(1, "(null) ran in 0.000 seconds\n");
  55:	83 ec 08             	sub    $0x8,%esp
  58:	68 c4 07 00 00       	push   $0x7c4
  5d:	6a 01                	push   $0x1
  5f:	e8 a3 04 00 00       	call   507 <printf>
  64:	83 c4 10             	add    $0x10,%esp
            else if(decimal < 100)
              printf(1, "0");
            printf(1, "%d seconds\n", decimal);
        }
    }
    exit();
  67:	e8 1a 03 00 00       	call   386 <exit>
            printf(1, "Ran in 0.000 seconds\n");
  6c:	83 ec 08             	sub    $0x8,%esp
  6f:	68 e1 07 00 00       	push   $0x7e1
  74:	6a 01                	push   $0x1
  76:	e8 8c 04 00 00       	call   507 <printf>
            exit();
  7b:	e8 06 03 00 00       	call   386 <exit>
            wait();
  80:	e8 09 03 00 00       	call   38e <wait>
            t2 = uptime();
  85:	e8 94 03 00 00       	call   41e <uptime>
            decimal = (t2 - t1) % 1000;
  8a:	29 f0                	sub    %esi,%eax
  8c:	bf e8 03 00 00       	mov    $0x3e8,%edi
  91:	99                   	cltd   
  92:	f7 ff                	idiv   %edi
  94:	89 d6                	mov    %edx,%esi
            printf(1, "%s ran in %d.", argv[0], elapsed);
  96:	50                   	push   %eax
  97:	ff 73 04             	pushl  0x4(%ebx)
  9a:	68 0f 08 00 00       	push   $0x80f
  9f:	6a 01                	push   $0x1
  a1:	e8 61 04 00 00       	call   507 <printf>
            if(decimal < 10)
  a6:	83 c4 10             	add    $0x10,%esp
  a9:	83 fe 09             	cmp    $0x9,%esi
  ac:	7e 1a                	jle    c8 <main+0xc8>
            else if(decimal < 100)
  ae:	83 fe 63             	cmp    $0x63,%esi
  b1:	7e 29                	jle    dc <main+0xdc>
            printf(1, "%d seconds\n", decimal);
  b3:	83 ec 04             	sub    $0x4,%esp
  b6:	56                   	push   %esi
  b7:	68 20 08 00 00       	push   $0x820
  bc:	6a 01                	push   $0x1
  be:	e8 44 04 00 00       	call   507 <printf>
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	eb 9f                	jmp    67 <main+0x67>
              printf(1, "00");
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	68 1d 08 00 00       	push   $0x81d
  d0:	6a 01                	push   $0x1
  d2:	e8 30 04 00 00       	call   507 <printf>
  d7:	83 c4 10             	add    $0x10,%esp
  da:	eb d7                	jmp    b3 <main+0xb3>
              printf(1, "0");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 1e 08 00 00       	push   $0x81e
  e4:	6a 01                	push   $0x1
  e6:	e8 1c 04 00 00       	call   507 <printf>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	eb c3                	jmp    b3 <main+0xb3>

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	56                   	push   %esi
  f8:	53                   	push   %ebx
  f9:	8b 75 08             	mov    0x8(%ebp),%esi
  fc:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ff:	89 f0                	mov    %esi,%eax
 101:	89 d1                	mov    %edx,%ecx
 103:	83 c2 01             	add    $0x1,%edx
 106:	89 c3                	mov    %eax,%ebx
 108:	83 c0 01             	add    $0x1,%eax
 10b:	0f b6 09             	movzbl (%ecx),%ecx
 10e:	88 0b                	mov    %cl,(%ebx)
 110:	84 c9                	test   %cl,%cl
 112:	75 ed                	jne    101 <strcpy+0x11>
    ;
  return os;
}
 114:	89 f0                	mov    %esi,%eax
 116:	5b                   	pop    %ebx
 117:	5e                   	pop    %esi
 118:	5d                   	pop    %ebp
 119:	c3                   	ret    

0000011a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 11a:	f3 0f 1e fb          	endbr32 
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	8b 4d 08             	mov    0x8(%ebp),%ecx
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 127:	0f b6 01             	movzbl (%ecx),%eax
 12a:	84 c0                	test   %al,%al
 12c:	74 0c                	je     13a <strcmp+0x20>
 12e:	3a 02                	cmp    (%edx),%al
 130:	75 08                	jne    13a <strcmp+0x20>
    p++, q++;
 132:	83 c1 01             	add    $0x1,%ecx
 135:	83 c2 01             	add    $0x1,%edx
 138:	eb ed                	jmp    127 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 13a:	0f b6 c0             	movzbl %al,%eax
 13d:	0f b6 12             	movzbl (%edx),%edx
 140:	29 d0                	sub    %edx,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    

00000144 <strlen>:

uint
strlen(char *s)
{
 144:	f3 0f 1e fb          	endbr32 
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 14e:	b8 00 00 00 00       	mov    $0x0,%eax
 153:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 157:	74 05                	je     15e <strlen+0x1a>
 159:	83 c0 01             	add    $0x1,%eax
 15c:	eb f5                	jmp    153 <strlen+0xf>
    ;
  return n;
}
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <memset>:

void*
memset(void *dst, int c, uint n)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	57                   	push   %edi
 168:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 16b:	89 d7                	mov    %edx,%edi
 16d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	fc                   	cld    
 174:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 176:	89 d0                	mov    %edx,%eax
 178:	5f                   	pop    %edi
 179:	5d                   	pop    %ebp
 17a:	c3                   	ret    

0000017b <strchr>:

char*
strchr(const char *s, char c)
{
 17b:	f3 0f 1e fb          	endbr32 
 17f:	55                   	push   %ebp
 180:	89 e5                	mov    %esp,%ebp
 182:	8b 45 08             	mov    0x8(%ebp),%eax
 185:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 189:	0f b6 10             	movzbl (%eax),%edx
 18c:	84 d2                	test   %dl,%dl
 18e:	74 09                	je     199 <strchr+0x1e>
    if(*s == c)
 190:	38 ca                	cmp    %cl,%dl
 192:	74 0a                	je     19e <strchr+0x23>
  for(; *s; s++)
 194:	83 c0 01             	add    $0x1,%eax
 197:	eb f0                	jmp    189 <strchr+0xe>
      return (char*)s;
  return 0;
 199:	b8 00 00 00 00       	mov    $0x0,%eax
}
 19e:	5d                   	pop    %ebp
 19f:	c3                   	ret    

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	f3 0f 1e fb          	endbr32 
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	57                   	push   %edi
 1a8:	56                   	push   %esi
 1a9:	53                   	push   %ebx
 1aa:	83 ec 1c             	sub    $0x1c,%esp
 1ad:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b0:	bb 00 00 00 00       	mov    $0x0,%ebx
 1b5:	89 de                	mov    %ebx,%esi
 1b7:	83 c3 01             	add    $0x1,%ebx
 1ba:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bd:	7d 2e                	jge    1ed <gets+0x4d>
    cc = read(0, &c, 1);
 1bf:	83 ec 04             	sub    $0x4,%esp
 1c2:	6a 01                	push   $0x1
 1c4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1c7:	50                   	push   %eax
 1c8:	6a 00                	push   $0x0
 1ca:	e8 cf 01 00 00       	call   39e <read>
    if(cc < 1)
 1cf:	83 c4 10             	add    $0x10,%esp
 1d2:	85 c0                	test   %eax,%eax
 1d4:	7e 17                	jle    1ed <gets+0x4d>
      break;
    buf[i++] = c;
 1d6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1da:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1dd:	3c 0a                	cmp    $0xa,%al
 1df:	0f 94 c2             	sete   %dl
 1e2:	3c 0d                	cmp    $0xd,%al
 1e4:	0f 94 c0             	sete   %al
 1e7:	08 c2                	or     %al,%dl
 1e9:	74 ca                	je     1b5 <gets+0x15>
    buf[i++] = c;
 1eb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1ed:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1f1:	89 f8                	mov    %edi,%eax
 1f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f6:	5b                   	pop    %ebx
 1f7:	5e                   	pop    %esi
 1f8:	5f                   	pop    %edi
 1f9:	5d                   	pop    %ebp
 1fa:	c3                   	ret    

000001fb <stat>:

int
stat(char *n, struct stat *st)
{
 1fb:	f3 0f 1e fb          	endbr32 
 1ff:	55                   	push   %ebp
 200:	89 e5                	mov    %esp,%ebp
 202:	56                   	push   %esi
 203:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 204:	83 ec 08             	sub    $0x8,%esp
 207:	6a 00                	push   $0x0
 209:	ff 75 08             	pushl  0x8(%ebp)
 20c:	e8 b5 01 00 00       	call   3c6 <open>
  if(fd < 0)
 211:	83 c4 10             	add    $0x10,%esp
 214:	85 c0                	test   %eax,%eax
 216:	78 24                	js     23c <stat+0x41>
 218:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 21a:	83 ec 08             	sub    $0x8,%esp
 21d:	ff 75 0c             	pushl  0xc(%ebp)
 220:	50                   	push   %eax
 221:	e8 b8 01 00 00       	call   3de <fstat>
 226:	89 c6                	mov    %eax,%esi
  close(fd);
 228:	89 1c 24             	mov    %ebx,(%esp)
 22b:	e8 7e 01 00 00       	call   3ae <close>
  return r;
 230:	83 c4 10             	add    $0x10,%esp
}
 233:	89 f0                	mov    %esi,%eax
 235:	8d 65 f8             	lea    -0x8(%ebp),%esp
 238:	5b                   	pop    %ebx
 239:	5e                   	pop    %esi
 23a:	5d                   	pop    %ebp
 23b:	c3                   	ret    
    return -1;
 23c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 241:	eb f0                	jmp    233 <stat+0x38>

00000243 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 243:	f3 0f 1e fb          	endbr32 
 247:	55                   	push   %ebp
 248:	89 e5                	mov    %esp,%ebp
 24a:	57                   	push   %edi
 24b:	56                   	push   %esi
 24c:	53                   	push   %ebx
 24d:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 250:	0f b6 02             	movzbl (%edx),%eax
 253:	3c 20                	cmp    $0x20,%al
 255:	75 05                	jne    25c <atoi+0x19>
 257:	83 c2 01             	add    $0x1,%edx
 25a:	eb f4                	jmp    250 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 25c:	3c 2d                	cmp    $0x2d,%al
 25e:	74 1d                	je     27d <atoi+0x3a>
 260:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 265:	3c 2b                	cmp    $0x2b,%al
 267:	0f 94 c1             	sete   %cl
 26a:	3c 2d                	cmp    $0x2d,%al
 26c:	0f 94 c0             	sete   %al
 26f:	08 c1                	or     %al,%cl
 271:	74 03                	je     276 <atoi+0x33>
    s++;
 273:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 276:	b8 00 00 00 00       	mov    $0x0,%eax
 27b:	eb 17                	jmp    294 <atoi+0x51>
 27d:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 282:	eb e1                	jmp    265 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 284:	8d 34 80             	lea    (%eax,%eax,4),%esi
 287:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 28a:	83 c2 01             	add    $0x1,%edx
 28d:	0f be c9             	movsbl %cl,%ecx
 290:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 294:	0f b6 0a             	movzbl (%edx),%ecx
 297:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 29a:	80 fb 09             	cmp    $0x9,%bl
 29d:	76 e5                	jbe    284 <atoi+0x41>
  return sign*n;
 29f:	0f af c7             	imul   %edi,%eax
}
 2a2:	5b                   	pop    %ebx
 2a3:	5e                   	pop    %esi
 2a4:	5f                   	pop    %edi
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    

000002a7 <atoo>:

int
atoo(const char *s)
{
 2a7:	f3 0f 1e fb          	endbr32 
 2ab:	55                   	push   %ebp
 2ac:	89 e5                	mov    %esp,%ebp
 2ae:	57                   	push   %edi
 2af:	56                   	push   %esi
 2b0:	53                   	push   %ebx
 2b1:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 2b4:	0f b6 0a             	movzbl (%edx),%ecx
 2b7:	80 f9 20             	cmp    $0x20,%cl
 2ba:	75 05                	jne    2c1 <atoo+0x1a>
 2bc:	83 c2 01             	add    $0x1,%edx
 2bf:	eb f3                	jmp    2b4 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 2c1:	80 f9 2d             	cmp    $0x2d,%cl
 2c4:	74 23                	je     2e9 <atoo+0x42>
 2c6:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 2cb:	80 f9 2b             	cmp    $0x2b,%cl
 2ce:	0f 94 c0             	sete   %al
 2d1:	89 c6                	mov    %eax,%esi
 2d3:	80 f9 2d             	cmp    $0x2d,%cl
 2d6:	0f 94 c0             	sete   %al
 2d9:	89 f3                	mov    %esi,%ebx
 2db:	08 c3                	or     %al,%bl
 2dd:	74 03                	je     2e2 <atoo+0x3b>
    s++;
 2df:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 2e2:	b8 00 00 00 00       	mov    $0x0,%eax
 2e7:	eb 11                	jmp    2fa <atoo+0x53>
 2e9:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 2ee:	eb db                	jmp    2cb <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	0f be c9             	movsbl %cl,%ecx
 2f6:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 2fa:	0f b6 0a             	movzbl (%edx),%ecx
 2fd:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 300:	80 fb 07             	cmp    $0x7,%bl
 303:	76 eb                	jbe    2f0 <atoo+0x49>
  return sign*n;
 305:	0f af c7             	imul   %edi,%eax
}
 308:	5b                   	pop    %ebx
 309:	5e                   	pop    %esi
 30a:	5f                   	pop    %edi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    

0000030d <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 30d:	f3 0f 1e fb          	endbr32 
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	53                   	push   %ebx
 315:	8b 55 08             	mov    0x8(%ebp),%edx
 318:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 31b:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 31e:	eb 09                	jmp    329 <strncmp+0x1c>
      n--, p++, q++;
 320:	83 e8 01             	sub    $0x1,%eax
 323:	83 c2 01             	add    $0x1,%edx
 326:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 329:	85 c0                	test   %eax,%eax
 32b:	74 0b                	je     338 <strncmp+0x2b>
 32d:	0f b6 1a             	movzbl (%edx),%ebx
 330:	84 db                	test   %bl,%bl
 332:	74 04                	je     338 <strncmp+0x2b>
 334:	3a 19                	cmp    (%ecx),%bl
 336:	74 e8                	je     320 <strncmp+0x13>
    if(n == 0)
 338:	85 c0                	test   %eax,%eax
 33a:	74 0b                	je     347 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 33c:	0f b6 02             	movzbl (%edx),%eax
 33f:	0f b6 11             	movzbl (%ecx),%edx
 342:	29 d0                	sub    %edx,%eax
}
 344:	5b                   	pop    %ebx
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    
      return 0;
 347:	b8 00 00 00 00       	mov    $0x0,%eax
 34c:	eb f6                	jmp    344 <strncmp+0x37>

0000034e <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 34e:	f3 0f 1e fb          	endbr32 
 352:	55                   	push   %ebp
 353:	89 e5                	mov    %esp,%ebp
 355:	56                   	push   %esi
 356:	53                   	push   %ebx
 357:	8b 75 08             	mov    0x8(%ebp),%esi
 35a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 35d:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 360:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 362:	8d 58 ff             	lea    -0x1(%eax),%ebx
 365:	85 c0                	test   %eax,%eax
 367:	7e 0f                	jle    378 <memmove+0x2a>
    *dst++ = *src++;
 369:	0f b6 01             	movzbl (%ecx),%eax
 36c:	88 02                	mov    %al,(%edx)
 36e:	8d 49 01             	lea    0x1(%ecx),%ecx
 371:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 374:	89 d8                	mov    %ebx,%eax
 376:	eb ea                	jmp    362 <memmove+0x14>
  return vdst;
}
 378:	89 f0                	mov    %esi,%eax
 37a:	5b                   	pop    %ebx
 37b:	5e                   	pop    %esi
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    

0000037e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37e:	b8 01 00 00 00       	mov    $0x1,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <exit>:
SYSCALL(exit)
 386:	b8 02 00 00 00       	mov    $0x2,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <wait>:
SYSCALL(wait)
 38e:	b8 03 00 00 00       	mov    $0x3,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <pipe>:
SYSCALL(pipe)
 396:	b8 04 00 00 00       	mov    $0x4,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <read>:
SYSCALL(read)
 39e:	b8 05 00 00 00       	mov    $0x5,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <write>:
SYSCALL(write)
 3a6:	b8 10 00 00 00       	mov    $0x10,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <close>:
SYSCALL(close)
 3ae:	b8 15 00 00 00       	mov    $0x15,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <kill>:
SYSCALL(kill)
 3b6:	b8 06 00 00 00       	mov    $0x6,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <exec>:
SYSCALL(exec)
 3be:	b8 07 00 00 00       	mov    $0x7,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <open>:
SYSCALL(open)
 3c6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <mknod>:
SYSCALL(mknod)
 3ce:	b8 11 00 00 00       	mov    $0x11,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <unlink>:
SYSCALL(unlink)
 3d6:	b8 12 00 00 00       	mov    $0x12,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <fstat>:
SYSCALL(fstat)
 3de:	b8 08 00 00 00       	mov    $0x8,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <link>:
SYSCALL(link)
 3e6:	b8 13 00 00 00       	mov    $0x13,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <mkdir>:
SYSCALL(mkdir)
 3ee:	b8 14 00 00 00       	mov    $0x14,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <chdir>:
SYSCALL(chdir)
 3f6:	b8 09 00 00 00       	mov    $0x9,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <dup>:
SYSCALL(dup)
 3fe:	b8 0a 00 00 00       	mov    $0xa,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <getpid>:
SYSCALL(getpid)
 406:	b8 0b 00 00 00       	mov    $0xb,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <sbrk>:
SYSCALL(sbrk)
 40e:	b8 0c 00 00 00       	mov    $0xc,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <sleep>:
SYSCALL(sleep)
 416:	b8 0d 00 00 00       	mov    $0xd,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <uptime>:
SYSCALL(uptime)
 41e:	b8 0e 00 00 00       	mov    $0xe,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <halt>:
SYSCALL(halt)
 426:	b8 16 00 00 00       	mov    $0x16,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <date>:
SYSCALL(date)
 42e:	b8 17 00 00 00       	mov    $0x17,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <getuid>:
SYSCALL(getuid)
 436:	b8 18 00 00 00       	mov    $0x18,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <getgid>:
SYSCALL(getgid)
 43e:	b8 19 00 00 00       	mov    $0x19,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <getppid>:
SYSCALL(getppid)
 446:	b8 1a 00 00 00       	mov    $0x1a,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <setuid>:
SYSCALL(setuid)
 44e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <setgid>:
SYSCALL(setgid)
 456:	b8 1c 00 00 00       	mov    $0x1c,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <getprocs>:
 45e:	b8 1d 00 00 00       	mov    $0x1d,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	83 ec 1c             	sub    $0x1c,%esp
 46c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 46f:	6a 01                	push   $0x1
 471:	8d 55 f4             	lea    -0xc(%ebp),%edx
 474:	52                   	push   %edx
 475:	50                   	push   %eax
 476:	e8 2b ff ff ff       	call   3a6 <write>
}
 47b:	83 c4 10             	add    $0x10,%esp
 47e:	c9                   	leave  
 47f:	c3                   	ret    

00000480 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 2c             	sub    $0x2c,%esp
 489:	89 45 d0             	mov    %eax,-0x30(%ebp)
 48c:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 48e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 492:	0f 95 c2             	setne  %dl
 495:	89 f0                	mov    %esi,%eax
 497:	c1 e8 1f             	shr    $0x1f,%eax
 49a:	84 c2                	test   %al,%dl
 49c:	74 42                	je     4e0 <printint+0x60>
    neg = 1;
    x = -xx;
 49e:	f7 de                	neg    %esi
    neg = 1;
 4a0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4a7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4ac:	89 f0                	mov    %esi,%eax
 4ae:	ba 00 00 00 00       	mov    $0x0,%edx
 4b3:	f7 f1                	div    %ecx
 4b5:	89 df                	mov    %ebx,%edi
 4b7:	83 c3 01             	add    $0x1,%ebx
 4ba:	0f b6 92 34 08 00 00 	movzbl 0x834(%edx),%edx
 4c1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4c5:	89 f2                	mov    %esi,%edx
 4c7:	89 c6                	mov    %eax,%esi
 4c9:	39 d1                	cmp    %edx,%ecx
 4cb:	76 df                	jbe    4ac <printint+0x2c>
  if(neg)
 4cd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4d1:	74 2f                	je     502 <printint+0x82>
    buf[i++] = '-';
 4d3:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4d8:	8d 5f 02             	lea    0x2(%edi),%ebx
 4db:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4de:	eb 15                	jmp    4f5 <printint+0x75>
  neg = 0;
 4e0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4e7:	eb be                	jmp    4a7 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 4e9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4ee:	89 f0                	mov    %esi,%eax
 4f0:	e8 71 ff ff ff       	call   466 <putc>
  while(--i >= 0)
 4f5:	83 eb 01             	sub    $0x1,%ebx
 4f8:	79 ef                	jns    4e9 <printint+0x69>
}
 4fa:	83 c4 2c             	add    $0x2c,%esp
 4fd:	5b                   	pop    %ebx
 4fe:	5e                   	pop    %esi
 4ff:	5f                   	pop    %edi
 500:	5d                   	pop    %ebp
 501:	c3                   	ret    
 502:	8b 75 d0             	mov    -0x30(%ebp),%esi
 505:	eb ee                	jmp    4f5 <printint+0x75>

00000507 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 507:	f3 0f 1e fb          	endbr32 
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	57                   	push   %edi
 50f:	56                   	push   %esi
 510:	53                   	push   %ebx
 511:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 514:	8d 45 10             	lea    0x10(%ebp),%eax
 517:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 51a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 51f:	bb 00 00 00 00       	mov    $0x0,%ebx
 524:	eb 14                	jmp    53a <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 526:	89 fa                	mov    %edi,%edx
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	e8 36 ff ff ff       	call   466 <putc>
 530:	eb 05                	jmp    537 <printf+0x30>
      }
    } else if(state == '%'){
 532:	83 fe 25             	cmp    $0x25,%esi
 535:	74 25                	je     55c <printf+0x55>
  for(i = 0; fmt[i]; i++){
 537:	83 c3 01             	add    $0x1,%ebx
 53a:	8b 45 0c             	mov    0xc(%ebp),%eax
 53d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 541:	84 c0                	test   %al,%al
 543:	0f 84 23 01 00 00    	je     66c <printf+0x165>
    c = fmt[i] & 0xff;
 549:	0f be f8             	movsbl %al,%edi
 54c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 54f:	85 f6                	test   %esi,%esi
 551:	75 df                	jne    532 <printf+0x2b>
      if(c == '%'){
 553:	83 f8 25             	cmp    $0x25,%eax
 556:	75 ce                	jne    526 <printf+0x1f>
        state = '%';
 558:	89 c6                	mov    %eax,%esi
 55a:	eb db                	jmp    537 <printf+0x30>
      if(c == 'd'){
 55c:	83 f8 64             	cmp    $0x64,%eax
 55f:	74 49                	je     5aa <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 561:	83 f8 78             	cmp    $0x78,%eax
 564:	0f 94 c1             	sete   %cl
 567:	83 f8 70             	cmp    $0x70,%eax
 56a:	0f 94 c2             	sete   %dl
 56d:	08 d1                	or     %dl,%cl
 56f:	75 63                	jne    5d4 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 571:	83 f8 73             	cmp    $0x73,%eax
 574:	0f 84 84 00 00 00    	je     5fe <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 57a:	83 f8 63             	cmp    $0x63,%eax
 57d:	0f 84 b7 00 00 00    	je     63a <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 583:	83 f8 25             	cmp    $0x25,%eax
 586:	0f 84 cc 00 00 00    	je     658 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 58c:	ba 25 00 00 00       	mov    $0x25,%edx
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	e8 cd fe ff ff       	call   466 <putc>
        putc(fd, c);
 599:	89 fa                	mov    %edi,%edx
 59b:	8b 45 08             	mov    0x8(%ebp),%eax
 59e:	e8 c3 fe ff ff       	call   466 <putc>
      }
      state = 0;
 5a3:	be 00 00 00 00       	mov    $0x0,%esi
 5a8:	eb 8d                	jmp    537 <printf+0x30>
        printint(fd, *ap, 10, 1);
 5aa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ad:	8b 17                	mov    (%edi),%edx
 5af:	83 ec 0c             	sub    $0xc,%esp
 5b2:	6a 01                	push   $0x1
 5b4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5b9:	8b 45 08             	mov    0x8(%ebp),%eax
 5bc:	e8 bf fe ff ff       	call   480 <printint>
        ap++;
 5c1:	83 c7 04             	add    $0x4,%edi
 5c4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5c7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ca:	be 00 00 00 00       	mov    $0x0,%esi
 5cf:	e9 63 ff ff ff       	jmp    537 <printf+0x30>
        printint(fd, *ap, 16, 0);
 5d4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5d7:	8b 17                	mov    (%edi),%edx
 5d9:	83 ec 0c             	sub    $0xc,%esp
 5dc:	6a 00                	push   $0x0
 5de:	b9 10 00 00 00       	mov    $0x10,%ecx
 5e3:	8b 45 08             	mov    0x8(%ebp),%eax
 5e6:	e8 95 fe ff ff       	call   480 <printint>
        ap++;
 5eb:	83 c7 04             	add    $0x4,%edi
 5ee:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5f1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5f4:	be 00 00 00 00       	mov    $0x0,%esi
 5f9:	e9 39 ff ff ff       	jmp    537 <printf+0x30>
        s = (char*)*ap;
 5fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 601:	8b 30                	mov    (%eax),%esi
        ap++;
 603:	83 c0 04             	add    $0x4,%eax
 606:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 609:	85 f6                	test   %esi,%esi
 60b:	75 28                	jne    635 <printf+0x12e>
          s = "(null)";
 60d:	be 2c 08 00 00       	mov    $0x82c,%esi
 612:	8b 7d 08             	mov    0x8(%ebp),%edi
 615:	eb 0d                	jmp    624 <printf+0x11d>
          putc(fd, *s);
 617:	0f be d2             	movsbl %dl,%edx
 61a:	89 f8                	mov    %edi,%eax
 61c:	e8 45 fe ff ff       	call   466 <putc>
          s++;
 621:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 624:	0f b6 16             	movzbl (%esi),%edx
 627:	84 d2                	test   %dl,%dl
 629:	75 ec                	jne    617 <printf+0x110>
      state = 0;
 62b:	be 00 00 00 00       	mov    $0x0,%esi
 630:	e9 02 ff ff ff       	jmp    537 <printf+0x30>
 635:	8b 7d 08             	mov    0x8(%ebp),%edi
 638:	eb ea                	jmp    624 <printf+0x11d>
        putc(fd, *ap);
 63a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 63d:	0f be 17             	movsbl (%edi),%edx
 640:	8b 45 08             	mov    0x8(%ebp),%eax
 643:	e8 1e fe ff ff       	call   466 <putc>
        ap++;
 648:	83 c7 04             	add    $0x4,%edi
 64b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 64e:	be 00 00 00 00       	mov    $0x0,%esi
 653:	e9 df fe ff ff       	jmp    537 <printf+0x30>
        putc(fd, c);
 658:	89 fa                	mov    %edi,%edx
 65a:	8b 45 08             	mov    0x8(%ebp),%eax
 65d:	e8 04 fe ff ff       	call   466 <putc>
      state = 0;
 662:	be 00 00 00 00       	mov    $0x0,%esi
 667:	e9 cb fe ff ff       	jmp    537 <printf+0x30>
    }
  }
}
 66c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66f:	5b                   	pop    %ebx
 670:	5e                   	pop    %esi
 671:	5f                   	pop    %edi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    

00000674 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 674:	f3 0f 1e fb          	endbr32 
 678:	55                   	push   %ebp
 679:	89 e5                	mov    %esp,%ebp
 67b:	57                   	push   %edi
 67c:	56                   	push   %esi
 67d:	53                   	push   %ebx
 67e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 681:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 684:	a1 3c 0b 00 00       	mov    0xb3c,%eax
 689:	eb 02                	jmp    68d <free+0x19>
 68b:	89 d0                	mov    %edx,%eax
 68d:	39 c8                	cmp    %ecx,%eax
 68f:	73 04                	jae    695 <free+0x21>
 691:	39 08                	cmp    %ecx,(%eax)
 693:	77 12                	ja     6a7 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 695:	8b 10                	mov    (%eax),%edx
 697:	39 c2                	cmp    %eax,%edx
 699:	77 f0                	ja     68b <free+0x17>
 69b:	39 c8                	cmp    %ecx,%eax
 69d:	72 08                	jb     6a7 <free+0x33>
 69f:	39 ca                	cmp    %ecx,%edx
 6a1:	77 04                	ja     6a7 <free+0x33>
 6a3:	89 d0                	mov    %edx,%eax
 6a5:	eb e6                	jmp    68d <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6aa:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ad:	8b 10                	mov    (%eax),%edx
 6af:	39 d7                	cmp    %edx,%edi
 6b1:	74 19                	je     6cc <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6b3:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6b6:	8b 50 04             	mov    0x4(%eax),%edx
 6b9:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6bc:	39 ce                	cmp    %ecx,%esi
 6be:	74 1b                	je     6db <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6c0:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6c2:	a3 3c 0b 00 00       	mov    %eax,0xb3c
}
 6c7:	5b                   	pop    %ebx
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6cc:	03 72 04             	add    0x4(%edx),%esi
 6cf:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d2:	8b 10                	mov    (%eax),%edx
 6d4:	8b 12                	mov    (%edx),%edx
 6d6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6d9:	eb db                	jmp    6b6 <free+0x42>
    p->s.size += bp->s.size;
 6db:	03 53 fc             	add    -0x4(%ebx),%edx
 6de:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6e4:	89 10                	mov    %edx,(%eax)
 6e6:	eb da                	jmp    6c2 <free+0x4e>

000006e8 <morecore>:

static Header*
morecore(uint nu)
{
 6e8:	55                   	push   %ebp
 6e9:	89 e5                	mov    %esp,%ebp
 6eb:	53                   	push   %ebx
 6ec:	83 ec 04             	sub    $0x4,%esp
 6ef:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6f1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6f6:	77 05                	ja     6fd <morecore+0x15>
    nu = 4096;
 6f8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6fd:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 704:	83 ec 0c             	sub    $0xc,%esp
 707:	50                   	push   %eax
 708:	e8 01 fd ff ff       	call   40e <sbrk>
  if(p == (char*)-1)
 70d:	83 c4 10             	add    $0x10,%esp
 710:	83 f8 ff             	cmp    $0xffffffff,%eax
 713:	74 1c                	je     731 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 715:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 718:	83 c0 08             	add    $0x8,%eax
 71b:	83 ec 0c             	sub    $0xc,%esp
 71e:	50                   	push   %eax
 71f:	e8 50 ff ff ff       	call   674 <free>
  return freep;
 724:	a1 3c 0b 00 00       	mov    0xb3c,%eax
 729:	83 c4 10             	add    $0x10,%esp
}
 72c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 72f:	c9                   	leave  
 730:	c3                   	ret    
    return 0;
 731:	b8 00 00 00 00       	mov    $0x0,%eax
 736:	eb f4                	jmp    72c <morecore+0x44>

00000738 <malloc>:

void*
malloc(uint nbytes)
{
 738:	f3 0f 1e fb          	endbr32 
 73c:	55                   	push   %ebp
 73d:	89 e5                	mov    %esp,%ebp
 73f:	53                   	push   %ebx
 740:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 743:	8b 45 08             	mov    0x8(%ebp),%eax
 746:	8d 58 07             	lea    0x7(%eax),%ebx
 749:	c1 eb 03             	shr    $0x3,%ebx
 74c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 74f:	8b 0d 3c 0b 00 00    	mov    0xb3c,%ecx
 755:	85 c9                	test   %ecx,%ecx
 757:	74 04                	je     75d <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 759:	8b 01                	mov    (%ecx),%eax
 75b:	eb 4b                	jmp    7a8 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 75d:	c7 05 3c 0b 00 00 40 	movl   $0xb40,0xb3c
 764:	0b 00 00 
 767:	c7 05 40 0b 00 00 40 	movl   $0xb40,0xb40
 76e:	0b 00 00 
    base.s.size = 0;
 771:	c7 05 44 0b 00 00 00 	movl   $0x0,0xb44
 778:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 77b:	b9 40 0b 00 00       	mov    $0xb40,%ecx
 780:	eb d7                	jmp    759 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 782:	74 1a                	je     79e <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 784:	29 da                	sub    %ebx,%edx
 786:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 789:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 78c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 78f:	89 0d 3c 0b 00 00    	mov    %ecx,0xb3c
      return (void*)(p + 1);
 795:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 798:	83 c4 04             	add    $0x4,%esp
 79b:	5b                   	pop    %ebx
 79c:	5d                   	pop    %ebp
 79d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 79e:	8b 10                	mov    (%eax),%edx
 7a0:	89 11                	mov    %edx,(%ecx)
 7a2:	eb eb                	jmp    78f <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a4:	89 c1                	mov    %eax,%ecx
 7a6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7a8:	8b 50 04             	mov    0x4(%eax),%edx
 7ab:	39 da                	cmp    %ebx,%edx
 7ad:	73 d3                	jae    782 <malloc+0x4a>
    if(p == freep)
 7af:	39 05 3c 0b 00 00    	cmp    %eax,0xb3c
 7b5:	75 ed                	jne    7a4 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 7b7:	89 d8                	mov    %ebx,%eax
 7b9:	e8 2a ff ff ff       	call   6e8 <morecore>
 7be:	85 c0                	test   %eax,%eax
 7c0:	75 e2                	jne    7a4 <malloc+0x6c>
 7c2:	eb d4                	jmp    798 <malloc+0x60>
