/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : zxcp

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2015-10-29 20:42:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `name` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', null, '水题', null);
INSERT INTO `t_category` VALUES ('2', null, '搜索', null);
INSERT INTO `t_category` VALUES ('3', null, '数据结构', null);
INSERT INTO `t_category` VALUES ('4', null, '位运算', null);
INSERT INTO `t_category` VALUES ('5', null, '线段树', null);
INSERT INTO `t_category` VALUES ('6', null, '栈', null);
INSERT INTO `t_category` VALUES ('7', null, '数学规律', null);
INSERT INTO `t_category` VALUES ('8', null, '素数', null);
INSERT INTO `t_category` VALUES ('9', null, '数组', null);
INSERT INTO `t_category` VALUES ('10', null, '字符串', null);
INSERT INTO `t_category` VALUES ('11', null, '康拓展开', null);
INSERT INTO `t_category` VALUES ('12', null, '其他', null);

-- ----------------------------
-- Table structure for t_contest
-- ----------------------------
DROP TABLE IF EXISTS `t_contest`;
CREATE TABLE `t_contest` (
  `id` bigint(20) NOT NULL auto_increment,
  `begain_date` datetime default NULL,
  `end_date` datetime default NULL,
  `name` varchar(255) default NULL,
  `remark` text,
  `state` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_contest
-- ----------------------------
INSERT INTO `t_contest` VALUES ('1', '2015-10-07 05:30:00', '2015-10-30 05:30:00', 'QDU创新实验室第二次月赛', '第二次月赛, 题目不难, 都是大家学过的内容, 大家好好考试.', '进行中', '公开赛');
INSERT INTO `t_contest` VALUES ('2', '2015-09-29 21:00:00', '2015-09-28 21:00:00', 'test2', '22', '进行中', '公开赛');

-- ----------------------------
-- Table structure for t_contest_problem
-- ----------------------------
DROP TABLE IF EXISTS `t_contest_problem`;
CREATE TABLE `t_contest_problem` (
  `id` bigint(20) NOT NULL auto_increment,
  `contest` bigint(20) default NULL,
  `problem` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_ge76xx8umrnm0ss9rcpta01o2` (`contest`),
  KEY `FK_8mv7n8wop1mmdvf8voqia3tdr` (`problem`),
  CONSTRAINT `FK_8mv7n8wop1mmdvf8voqia3tdr` FOREIGN KEY (`problem`) REFERENCES `t_problem` (`id`),
  CONSTRAINT `FK_ge76xx8umrnm0ss9rcpta01o2` FOREIGN KEY (`contest`) REFERENCES `t_contest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_contest_problem
-- ----------------------------
INSERT INTO `t_contest_problem` VALUES ('1', '1', '1');
INSERT INTO `t_contest_problem` VALUES ('2', '1', '3');
INSERT INTO `t_contest_problem` VALUES ('3', '1', '5');
INSERT INTO `t_contest_problem` VALUES ('4', '1', '10');
INSERT INTO `t_contest_problem` VALUES ('5', '1', '13');

-- ----------------------------
-- Table structure for t_problem
-- ----------------------------
DROP TABLE IF EXISTS `t_problem`;
CREATE TABLE `t_problem` (
  `id` bigint(20) NOT NULL auto_increment,
  `cpulimit` bigint(20) default NULL,
  `create_date` datetime default NULL,
  `hard` varchar(255) default NULL,
  `input` text,
  `inputemp` varchar(255) default NULL,
  `inputok` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `output` text,
  `outputemp` varchar(255) default NULL,
  `outputok` varchar(255) default NULL,
  `reference` varchar(255) default NULL,
  `remark` text,
  `timelimit` bigint(20) default NULL,
  `type` varchar(255) default NULL,
  `category` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_gnfeost3i4wg6ua7itk9uxeef` (`category`),
  CONSTRAINT `FK_gnfeost3i4wg6ua7itk9uxeef` FOREIGN KEY (`category`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_problem
-- ----------------------------
INSERT INTO `t_problem` VALUES ('1', '256', '2015-10-29 18:44:16', '简单', '两个用空格分开的整数.', '1 1', '2\r\n7', 'A + B Problem', '两数之和', '2', '9', '', '请计算两个整数的和并输出结果.', '1000', '1', null);
INSERT INTO `t_problem` VALUES ('3', '256', '2015-10-29 18:48:57', '简单', '第一行包含一个整数T(T <= 1000), 表示测试数据的组数. 每组测试数据的第一行有两个整数n(0 < n < 1000) 和m (0 < m < 1000), 分别表示字典中单词的数目和待查找的单词的数目 接下来n行, 代表字典中的单词, 每个单词由小写字母和\'?\'以及\'*\'组成, 单词长度不超过6. 接下来m行, 代表待查找的单词, 每个单词由小写字母组成, 单词长度不超过20.', '2\r\n2 3\r\n*\r\n?\r\nabj\r\nab\r\na\r\n3 4\r\nab?d\r\na*e\r\nabc\r\nabcd\r\nabcde\r\nax\r\nae', '2\r\n2 3\r\n*\r\n?\r\nabj\r\nab\r\na\r\n3 4\r\nab?d\r\na*e\r\nabc\r\nabcd\r\nabcde\r\nax\r\nae', 'GZS与古英文字典', '每组数据输出两行 第一行 Case #x:, x表示组数编号，从1开始. 第二行 对于每个待查找的单词, 如果存在于字典中, 则输出1, 否则, 输出0.', 'Case #1:\r\n111\r\nCase #2:\r\n1101', 'Case #1:\r\n111\r\nCase #2:\r\n1101', '', '有一天, GZS得到一本古代的英文字典, 很可惜, 由于年代久远, 很多单词都看不清楚了. 但是, 这怎么能难倒我们的G神呢, G神想要用这本字典查询一些单词, 下面给出字典中的内容. 字典中的单词全部由小写字母组成, 字迹模糊的部分用\'?\'或者\'*\'来表示, \'?\'可以匹配一个小写字母, \'*\'可以匹配0个或者1个或者多个小写字母. 例如, a?b可以代表aab, abb......azb, 而a*b可以代表ab, aab, abb...azb, aaab, aabb......然后给出一部分待查找的单词, 全部由小写字母组成. 如果能在字典中找到这个单词, 请输出1, 否则, 输出0.对于这种小事GZS觉得很是无聊, 你快来写个程序帮帮他吧.', '1000', null, '1');
INSERT INTO `t_problem` VALUES ('4', '256', '2015-10-29 18:50:14', '简单', '多组测试数据，每组数据一行，包含两个数字l和r。1<=l<=r<=5*10^6。', '2 17\r\n14 17', '2 17\r\n14 17', 'GZS与素数大法', '如果存在，则按样例格式输出最近的两个素数和最远的两个素数（如果有多个，输出最小的）；如果不存在，输出一行：There are no adjacent primes.', '2,3 are closest, 7,11 are most distant.\r\nThere are no adjacent primes.', '2,3 are closest, 7,11 are most distant.\r\nThere are no adjacent primes.', '', '自从GZS成为G神之后，追随者不计其数，更是有了大名鼎鼎的拜神论：\r\n\r\n\"吾尝终日编程也，不如须臾之拜拜G神也；吾尝打字刷题也，不如一日三拜G神也；\r\n\r\n拜拜G神，程序非长也，而出结果；三拜G神，打字非快也，而能AC。\r\n\r\n吾日三拜G神也！！！“\r\n\r\n作为菜鸟，经常遇到一些难题，于是就去拜见G神了。G神一看题目，微微一笑说道：“这种水题也算难题？我闭着眼都能一分钟刷十道！”毕竟是G神，我等菜鸟还是得虚心向G神学习。各位大神们，相信这道水题你们也能很快就AC吧。题目是这样的：\r\n\r\n \r\n\r\n给定一个范围[l,r]，求[l, r]中的距离最近的两个相邻素数和距离最远的两个相邻素数。', '1000', null, '1');
INSERT INTO `t_problem` VALUES ('5', '256', '2015-10-29 18:51:38', '简单', '第一行为一个整数N ( N <= 100000) 代表整数个数； 第二行为N个整数，并且每个正整数的值都不大于10^6； 第三行为一个整数K ( K <= N );', '5\r\n1 2 2 4 5\r\n3', '5\r\n1 2 2 4 5\r\n3', 'GZS送温暖', '输出一行，包含一个整数。这个整数就是这个序列里面排第K小的数。', '2', '2', '', ' 众所周知，GZS是一个总是考第一的大学霸，为什么呢？因为GZS喜欢思考！(逃…\r\n当然，GZS也有不愿意动脑的时候，给你N个正整数(可以重复)，GZS希望让你告诉他这些正整数里面第K小的数是多少。简单吗，ACCEPT it！', '1000', null, '1');
INSERT INTO `t_problem` VALUES ('6', '256', '2015-10-29 18:54:50', '简单', 'There are multiple test cases. The first line of input contains an integer T, indicating the number of test cases. For each test case there are two strings s and t, one per line. 1 ≤ T ≤ 10^5 1 ≤ ', '4\r\na\r\nb\r\ncat\r\ncats\r\ndo\r\ndo\r\napple\r\naapple', '5\r\n1 2 2 4 5\r\n3', 'GZS and String', 'For each test case, output \"Yes\" if GZS can convert s to t, otherwise output \"No\".', 'No\r\nYes\r\nYes\r\nNo', '2', '', 'GZS has two strings s and t.\r\n\r\nIn each step, GZS can select arbitrary character c of s and insert any character d (d ≠ c) just after it.\r\n\r\nGZS wants to convert s to t. But is it possible?', '1000', null, '1');
INSERT INTO `t_problem` VALUES ('7', '256', '2015-10-29 18:56:23', '简单', '第一行输入一个整数N，表示共有N组测试数据 每一组数据都是先输入该地图的行数m(0<m<100)与列数n(0<n<100)，然后，输入接下来的m行每行输入n个数，表示此处有水还是没水（1表示此处是水池，0表示此处是地面）', '2\r\n3 4\r\n1 0 0 0 \r\n0 0 1 1\r\n1 1 1 0\r\n5 5\r\n1 1 1 1 0\r\n0 0 1 0 1\r\n0 0 0 0 0\r\n1 1 1 0 0\r\n0 0 1 1 1', '2\r\n3 4\r\n1 0 0 0 \r\n0 0 1 1\r\n1 1 1 0\r\n5 5\r\n1 1 1 1 0\r\n0 0 1 0 1\r\n0 0 0 0 0\r\n1 1 1 0 0\r\n0 0 1 1 1', 'GZS与小公园', '输出该地图中水池的个数。', '2\r\n3', '2\r\n3', '', '某天GZS漫步在学校新建的小公园，他发现那里建成了一些水池和小河道。我们暂且把它们统一看成水池。假设公园旁有一张小公园的地图，上面仅标识了此处是否是水池，你能帮GZS计算出该地图中一共有几个水池吗。', '1000', null, '1');
INSERT INTO `t_problem` VALUES ('8', '256', '2015-10-29 18:57:06', '简单', '一个整数T(T<=100)代表测试数据组数，接下来一行一个整数n(1<=n<=1000000)表示一共有多少个格子，接下来一行n个空格隔开的整数bi(-1e9<bi<1e9)，其中，大于等于0表示蘑菇的大小，小于0表示坑的大小。', '2\r\n5\r\n1 -2 3 4 -5\r\n5\r\n1 -2 4 -3 5', '2\r\n5\r\n1 -2 3 4 -5\r\n5\r\n1 -2 4 -3 5', 'GZS采蘑菇', '每组数据输出一个整数表示GZS最多能采的蘑菇总量。', '7\r\n6', '7\r\n6', '', '为了提高青大餐厅的膳食营养，GZS决定去野外采蘑菇，但不幸的是，由于去的比较晚，野林里的蘑菇所剩无几，只剩一长排了，这一长排有n个格子，而且这n个格子当中的一些蘑菇还有的被别人采去了，所以留下了一些坑。为了走过去这个坑，必须拿蘑菇来填。至少填平才能通过。蘑菇和坑都有大小，每单位蘑菇可以填每单位的坑。GZS有两个神技，神技A:可以从野外跳到任意一个格子，跳进格子之后，只能往右采；神技B:如果当前在格子中，可以从格子跳出到野外，一旦跳出来就不能再回去，这两个神技各能使用一次。但是如果都是坑的话，可以选择不采任何蘑菇回家。', '1000', null, '1');
INSERT INTO `t_problem` VALUES ('9', '256', '2015-10-29 18:58:31', '简单', 'Multiple test cases(less than 100), for each test case, the only line indicates the positive integer n(n≤10000).', '3\r\n9', '3\r\n9', 'LC and Prime', 'For each test case, print the number of ways.', '0\r\n2', '0\r\n2', '', 'Given a number n, please count how many tuple(p1, p2, p3) satisfied that p1<=p2<=p3, p1,p2,p3 are primes and p1 + p2 + p3 = n.', '1000', null, '1');
INSERT INTO `t_problem` VALUES ('10', '256', '2015-10-29 18:59:16', '简单', '第一行输入一个T(T <= 50), 表示一共有T组测试数据. 接下来T行, 每行为一组由小写字母组成, 长度不超过10^5的字符串.', '3\r\naba\r\nabc\r\naabaa', '3\r\naba\r\nabc\r\naabaa', 'LC和加玛帝国的公主', '每行一个整数X, 表示该组字符串中所包含的最长回文长度.', '3\r\n1\r\n5', '3\r\n1\r\n5', '', '有一天, 我们帅气的LC来到加玛帝国. 有时候, 缘分就是这么奇怪, LC和加玛帝国的公主一见钟情, 奈何公主的父王不同意, 因为他觉得LC除了长得特别帅之外, 并没有一技之长.\r\n\r\nLC对此呵呵一笑, 他说, 我可是创新实验室走出来的学生, 我会的技能可多着呢, 先说个简单的吧, 只要你给我任意一串字符串, 我就能立马算出这串字符串当中最长回文串的长度. 国王很是吃惊, 说要考一考LC.\r\n\r\n于是国王想让你帮忙写一个程序, 用来比对LC的答案, 快来帮帮国王吧!', '1000', null, '1');
INSERT INTO `t_problem` VALUES ('11', '256', '2015-10-29 19:00:50', '简单', '输入有多个数据，数据以EOF结束；每个数据ni（0<=ni<=1000010000）用空格隔开；', '0 \r\n1 \r\n2 \r\n10', '0 \r\n1 \r\n2 \r\n10', 'LC的烦恼', '输出有多行，每行对应一个十进制数ni的二进制数； 注意：输出的二进制去掉任何一个多余的前导0；', '0\r\n1\r\n10\r\n1010', '0\r\n1\r\n10\r\n1010', '', 'LC经常抱怨：“C语言中的格式输出中有十六、十、八进制输出，然而却没有二进制输出，哎，真遗憾！谁能帮我写一个程序实现输入一个十进制数n，输出它的二进制数呀？”\r\n\r\n难道你不想帮帮她吗？', '1000', null, '1');
INSERT INTO `t_problem` VALUES ('12', '256', '2015-10-29 19:01:47', '简单', '输入 一个整数T，后面T行， T<= 20, 每行两个整数n和m。 0 <= n <= 10 ^ 8; 0 <= m <= 100', '4\r\n1 2\r\n2 4\r\n5 3\r\n10 5', '4\r\n1 2\r\n2 4\r\n5 3\r\n10 5', 'LC的涂色游戏', '一共T行，每行一个整数,结果可能很大，最终结果对1000007取余。', '2\r\n16\r\n243\r\n765562', '2\r\n16\r\n243\r\n765562', '', 'LC是实验室传说级的大神，最近喜欢上了涂色游戏，现在纸上有n块空白区域，lc手中有m种颜色，他突然想知道，用手中所有颜色，将空白涂满有多少种方案（每个空白只能涂一种颜色），lc当然可以快速算出来了，不过他现在忙着涂色，你能很快的算出来吗？', '1000', null, '1');
INSERT INTO `t_problem` VALUES ('13', '256', '2015-10-29 19:02:50', '一般', '多组测试数据 每组测试数据的第一行为n（0 <= n <= 100)， 表示图形有n个小矩形构成 接下来一行输入n个整数h1, h2...hn(0 <= hi <= 1000), 表示每个小矩形的高度 n为0时程序结束', '7\r\n2 1 4 5 1 3 3\r\n4\r\n1000 1000 1000 1000\r\n0', '7\r\n2 1 4 5 1 3 3\r\n4\r\n1000 1000 1000 1000\r\n0', 'LC的课后辅导', '仅输出一行表示面积的最大值', '8\r\n4000', '8\r\n4000', '2014级实验室纳新考试', '有一天，LC给我们出了一道题，如图：\r\n\r\n45660aba95464e61adfbbcc7cea2c44c.jpg\r\n\r\n这个图形从左到右由若干个 宽为1 高不确定 的小矩形构成，求出这个图形所包含的最大矩形面积。', '1000', null, '1');

-- ----------------------------
-- Table structure for t_rank
-- ----------------------------
DROP TABLE IF EXISTS `t_rank`;
CREATE TABLE `t_rank` (
  `userid` bigint(20) NOT NULL,
  `num1` double default '0',
  `num2` double NOT NULL default '0',
  `num3` double NOT NULL default '0',
  `num4` double NOT NULL default '0',
  `num5` double NOT NULL default '0',
  `num6` double NOT NULL default '0',
  `num7` double NOT NULL default '0',
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rank
-- ----------------------------
INSERT INTO `t_rank` VALUES ('1', '0', '0', '0', '0', '0', '0', '0', '胡锦涛');

-- ----------------------------
-- Table structure for t_submission
-- ----------------------------
DROP TABLE IF EXISTS `t_submission`;
CREATE TABLE `t_submission` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `input` varchar(255) default NULL,
  `language` varchar(255) default NULL,
  `result` text,
  `spend` double default NULL,
  `state` varchar(255) default NULL,
  `contest_problem` bigint(20) default NULL,
  `problem` bigint(20) default NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_csuodox26o85htxc3okax9he5` (`contest_problem`),
  KEY `FK_pkdsg4wawtnhyeumk3yw3wuxr` (`problem`),
  KEY `FK_h1wu3d00r3bwn42lwmxgkm94v` (`user`),
  CONSTRAINT `FK_csuodox26o85htxc3okax9he5` FOREIGN KEY (`contest_problem`) REFERENCES `t_contest_problem` (`id`),
  CONSTRAINT `FK_h1wu3d00r3bwn42lwmxgkm94v` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_pkdsg4wawtnhyeumk3yw3wuxr` FOREIGN KEY (`problem`) REFERENCES `t_problem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_submission
-- ----------------------------
INSERT INTO `t_submission` VALUES ('1', '2015-10-29 19:06:02', '456456456', '3', null, null, '文件错误', null, '5', null);
INSERT INTO `t_submission` VALUES ('2', '2015-10-29 19:11:18', '456456456', '3', '编译错误d:\\work_path\\java\\Main.java:1: 错误: 需要class, interface或enum\n456456456\n^\n1 个错误\n', null, '编译错误', null, '5', null);
INSERT INTO `t_submission` VALUES ('3', '2015-10-29 19:11:58', 'sdfasfdasdfsdf', '3', '编译错误d:\\work_path\\java\\Main.java:1: 错误: 解析时已到达文件结尾\nsdfasfdasdfsdf\n^\n1 个错误\n', null, '编译错误', null, '5', null);
INSERT INTO `t_submission` VALUES ('4', '2015-10-29 19:12:23', 'sdfasdfasdfasdf', '3', '编译错误d:\\work_path\\java\\Main.java:1: 错误: 解析时已到达文件结尾\nsdfasdfasdfasdf\n^\n1 个错误\n', null, '编译错误', null, '5', null);
INSERT INTO `t_submission` VALUES ('5', '2015-10-29 19:12:58', 'import java.util.Scanner;\npublic class Main{\n    public static void main(String[] args){\n        Scanner in=new Scanner(System.in);\n        int a=in.nextInt();\n        int b=in.nextInt();\n        System.out.println((a+b));  \n    }\n}', '3', '6', null, '答案错误', null, '5', '1');
INSERT INTO `t_submission` VALUES ('6', '2015-10-29 19:13:19', 'import java.util.Scanner;\npublic class Main{\n    public static void main(String[] args){\n        Scanner in=new Scanner(System.in);\n        int a=in.nextInt();\n        int b=in.nextInt();\n        System.out.println((a+b));  \n    }\n}', '3', '9', null, '成功', null, '1', '1');
INSERT INTO `t_submission` VALUES ('7', '2015-10-29 19:16:48', '第二次月赛, 题目不难, 都是大家学过的内容, 大家好好考试.', '3', '编译错误d:\\work_path\\java\\Main.java:1: 错误: 需要class, interface或enum\n第二次月赛, 题目不难, 都是大家学过的内容, 大家好好考试.\n^\n1 个错误\n', null, '编译错误', '1', '1', '1');
INSERT INTO `t_submission` VALUES ('8', '2015-10-29 19:19:41', 'problems/${contestProblem.id}problems/${contestProblem.id}', '3', '编译错误d:\\work_path\\java\\Main.java:1: 错误: 需要class, interface或enum\nproblems/${contestProblem.id}problems/${contestProblem.id}\n^\n1 个错误\n', null, '编译错误', '1', '1', '1');
INSERT INTO `t_submission` VALUES ('9', '2015-10-29 19:56:03', 'import java.util.Scanner;\npublic class Main{\n    public static void ma111in(String[] args){\n        Scanner in=new Scanner(System.in);\n        int a=in.nextInt();\n        int b=in.nextInt();\n        System.out.println((a+b));  \n    }\n}', '3', 'D:\\work_path\\java>java Main ', null, '答案错误', null, '1', '1');
INSERT INTO `t_submission` VALUES ('10', '2015-10-29 19:56:41', 'import java.util.Scanner;\npublic class Main{\n    public static void main(String[] args){\n        Scanner in=new Scanner(System.in);\n        int a=in.nextInt();\n        int b=in.nextInt();\n        System.out.println((a+b));  \n    }\n}', '3', '9', null, '成功', null, '1', '1');
INSERT INTO `t_submission` VALUES ('11', '2015-10-29 19:56:50', '223123', '3', '编译错误d:\\work_path\\java\\Main.java:1: 错误: 需要class, interface或enum\n223123\n^\n1 个错误\n', null, '编译错误', null, '1', '1');
INSERT INTO `t_submission` VALUES ('12', '2015-10-29 19:58:09', 'import java.util.Sca11nner;\npublic cl11ass Main{\n    public static void main(String[] args){\n        Scanner in=new Scanner(System.in);\n        int a=in.nextInt();\n        int b=in.nextInt();\n        System.out.println((a+b));  \n    }\n}', '3', '编译错误d:\\work_path\\java\\Main.java:2: 错误: 需要class, interface或enum\npublic cl11ass Main{\n       ^\nd:\\work_path\\java\\Main.java:3: 错误: 需要class, interface或enum\n    public static void main(String[] args){\n                  ^\nd:\\work_path\\java\\Main.java:5: 错误: 需要class, interface或enum\n        int a=in.nextInt();\n        ^\nd:\\work_path\\java\\Main.java:6: 错误: 需要class, interface或enum\n        int b=in.nextInt();\n        ^\nd:\\work_path\\java\\Main.java:7: 错误: 需要class, interface或enum\n        System.out.println((a+b));  \n        ^\nd:\\work_path\\java\\Main.java:8: 错误: 需要class, interface或enum\n    }\n    ^\n6 个错误\n', null, '编译错误', null, '1', '1');
INSERT INTO `t_submission` VALUES ('13', '2015-10-29 19:58:35', '345345', '3', '编译错误d:\\work_path\\java\\Main.java:1: 错误: 需要class, interface或enum\n345345\n^\n1 个错误\n', null, '编译错误', '1', '1', '1');
INSERT INTO `t_submission` VALUES ('14', '2015-10-29 19:59:06', 'import java.util.Scanner;\npublic class Main{\n    public static void main(String[] args){\n        Scanner in=new Scanner(System.in);\n        int a=in.nextInt();\n        int b=in.nextInt();\n        System.out.println((a+b));  \n    }\n}', '3', '9', null, '成功', '1', '1', '1');
INSERT INTO `t_submission` VALUES ('15', '2015-10-29 20:01:17', '22', '3', '编译错误d:\\work_path\\java\\Main.java:1: 错误: 需要class, interface或enum\n22\n^\n1 个错误\n', null, '编译错误', null, '1', '1');
INSERT INTO `t_submission` VALUES ('16', '2015-10-29 20:02:54', 'A + B ProblemA + B Problem', '3', '编译错误d:\\work_path\\java\\Main.java:1: 错误: 需要class, interface或enum\nA + B ProblemA + B Problem\n^\n1 个错误\n', null, '编译错误', null, '1', '1');
INSERT INTO `t_submission` VALUES ('17', '2015-10-29 20:03:12', 'import java.util.Scanner;\npublic class Main{\n    public static void main(String[] args){\n        Scanner in=new Scanner(System.in);\n        int a=in.nextInt();\n        int b=in.nextInt();\n        System.out.println((a+b));  \n    }\n}', '3', '9', null, '成功', null, '1', '1');
INSERT INTO `t_submission` VALUES ('18', '2015-10-29 20:03:22', 'import java.util.Sc111anner;\npub111lic cl111ass Main{\n    public static void main(String[] args){\n        Scanner in=new Scanner(System.in);\n        int a=in.nextInt();\n        int b=in.nextInt();\n        System.out.println((a+b));  \n    }\n}', '3', '编译错误d:\\work_path\\java\\Main.java:2: 错误: 需要class, interface或enum\npub111lic cl111ass Main{\n^\nd:\\work_path\\java\\Main.java:3: 错误: 需要class, interface或enum\n    public static void main(String[] args){\n                  ^\nd:\\work_path\\java\\Main.java:5: 错误: 需要class, interface或enum\n        int a=in.nextInt();\n        ^\nd:\\work_path\\java\\Main.java:6: 错误: 需要class, interface或enum\n        int b=in.nextInt();\n        ^\nd:\\work_path\\java\\Main.java:7: 错误: 需要class, interface或enum\n        System.out.println((a+b));  \n        ^\nd:\\work_path\\java\\Main.java:8: 错误: 需要class, interface或enum\n    }\n    ^\n6 个错误\n', null, '编译错误', null, '1', '1');
INSERT INTO `t_submission` VALUES ('19', '2015-10-29 20:03:40', '1234123123', '3', '编译错误d:\\work_path\\java\\Main.java:1: 错误: 需要class, interface或enum\n1234123123\n^\n1 个错误\n', null, '编译错误', '1', '1', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `address` varchar(255) default NULL,
  `create_date` datetime default NULL,
  `email` varchar(255) default NULL,
  `level` varchar(255) default NULL,
  `manger` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `yyzh` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '中南海', null, '34534@sina.com', null, null, '胡锦涛', '123456', null, 'user1', null);
INSERT INTO `t_user` VALUES ('2', '中南海', '2015-10-29 19:44:08', '34534@sina.com', null, null, '胡锦涛', '123456', '1', 'user2', null);
INSERT INTO `t_user` VALUES ('3', 'XXX', null, '34534@sina.com', null, null, '小张', '123456', null, 'user3', null);
INSERT INTO `t_user` VALUES ('4', 'XXX ', null, '34534@sina.com', null, null, 'X', '123456', null, 'user100', null);
INSERT INTO `t_user` VALUES ('5', 'XXX', null, '34534@sina.com', null, null, 'user900', '123456', null, 'user900', null);

-- ----------------------------
-- Procedure structure for prc_report
-- ----------------------------
DROP PROCEDURE IF EXISTS `prc_report`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_report`(IN `cid` bigint)
BEGIN
	   DECLARE a bigint; 
   DECLARE i bigint default 0;   
   DECLARE s int default 0;   
   DECLARE  c1 CURSOR   FOR SELECT problem FROM t_contest_problem WHERE contest=cid;
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET s=1;  
 
  DELETE FROM t_rank;
  INSERT INTO t_rank(userid,username)
  SELECT DISTINCT t4.id,t4.name FROM t_submission t1,t_contest_problem t2, t_contest t3,t_user t4
  WHERE t1.contest_problem=t2.id AND t3.id='1' AND t1.user=t4.id;

   OPEN c1;                      
    fetch  c1 into a; 
    while s <> 1 do  
     SET i=i+1;
    
      IF i=1 then
        UPDATE t_rank set num1=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
          
      end if; 
      IF i=2 then
          UPDATE t_rank set num2=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
       IF i=3 then
            UPDATE t_rank set num3=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
      IF i=4 then
           UPDATE t_rank set num4=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
      IF i=5 then
         UPDATE t_rank set num5=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
      IF i=6 then
         UPDATE t_rank set num6=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
      IF i=7 then
              UPDATE t_rank set num7=(SELECT if(MIN(spend) IS NULL ,0,MIN(spend)) FROM t_submission t1 WHERE t1.contest_problem=a AND t1.user=t_rank.userid AND t1.state='成功');
      end if; 
     fetch  c1 into a;                  
    end while;   
    
  CLOSE c1 ; 

END
;;
DELIMITER ;
