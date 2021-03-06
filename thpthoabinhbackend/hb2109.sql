USE [master]
GO
/****** Object:  Database [HoaBinh]    Script Date: 9/21/2017 8:01:57 PM ******/
CREATE DATABASE [HoaBinh]
GO
USE [HoaBinh]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/21/2017 8:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[ImageUrl] [nvarchar](100) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_PostCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 9/21/2017 8:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[PContent] [ntext] NULL,
	[AuthorId] [int] NULL,
	[CategoryId] [int] NULL,
	[DateCreated] [datetime] NULL,
	[Active] [bit] NULL,
	[Slug] [varchar](100) NULL,
	[DateModified] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Image] [varchar](100) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 9/21/2017 8:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](60) NULL,
	[FullName] [nvarchar](50) NULL,
	[Role] [varchar](20) NULL,
	[Active] [bit] NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Profile] [nvarchar](400) NULL,
	[Image] [varchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Description], [ImageUrl], [Active]) VALUES (1, N'Bài Viết', N'Lưu bài viết hằng ngày', N'No image', 1)
INSERT [dbo].[Category] ([Id], [Name], [Description], [ImageUrl], [Active]) VALUES (2, N'Thời Khóa Biểu', N'Lưu thời khóa biểu', N'No image', 1)
INSERT [dbo].[Category] ([Id], [Name], [Description], [ImageUrl], [Active]) VALUES (3, N'Tài Liệu', N'Tài liệu học tập', N'No image', 1)
INSERT [dbo].[Category] ([Id], [Name], [Description], [ImageUrl], [Active]) VALUES (5, N'Hình Ảnh', N'Hình ảnh cũ', NULL, 1)
INSERT [dbo].[Category] ([Id], [Name], [Description], [ImageUrl], [Active]) VALUES (6, N'Video Nhà Trường', N'', NULL, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Title], [PContent], [AuthorId], [CategoryId], [DateCreated], [Active], [Slug], [DateModified], [ViewCount], [Image]) VALUES (1, N'Thông cáo số 1 về kỳ thi tốt nghiệp THPT năm 2012', N'Kỳ thi tốt nghiệp
THPT năm 2012 được tổ chức trong các ngày 02,03 và 04/6/2012. Cho đến thời điểm hiện tại, công tác chuẩn bị cho kỳ thi về cơ bản đã hoàn tất. Các địa phương trên toàn quốc đã tích cực chuẩn bị các điều kiện tổ chức thi, hướng dẫn cho thí sinh đăng ký dự thi đảm bảo quy định của Quy chế, các phương án dự phòng cũng đã được triển khai. Theo báo cáo từ các đơn vị, số liệu của Kỳ thi được tổng hợp như sau: 1. Tổng số thí sinh đăng ký dự thi: 963.571. Trong đó, có: - 856.271 thí sinh GD THPT. - 107.300 thí sinh GDTX. 2. Tổng số phòng thi: 40.620. 3. Tổng số Hội đồng coi thi: 2.307. 4. Số cán bộ giáo viên tham gia coi thi: 124.153. 5. Số cán bộ giáo viên tham gia chấm thi: 27.472. Cục Khảo thí và Kiểm định chất lượng giáo dục trân trọng thông báo./. Nơi nhận: - Các cơ quan thông tấn báo chí; - Ban Chỉ đạo thi Phổ thông Trung ương; - Lưu: VP Cục. CỤC TRƯỞNG (đã ký) Ngô Kim Khôi nguồn:http://www.moet.gov.vn/?page=1.29&view=4175', 1, 1, CAST(N'2017-09-03 11:24:15.000' AS DateTime), 1, N'thaang-caao-saaa-1-vaaa-kaaa-thi-taaat-nghiaaap-thpt-naam-2013', CAST(N'2017-09-17 11:27:27.077' AS DateTime), 1, N'post1.jpg')
INSERT [dbo].[Post] ([Id], [Title], [PContent], [AuthorId], [CategoryId], [DateCreated], [Active], [Slug], [DateModified], [ViewCount], [Image]) VALUES (2, N'Học sinh tựu trường sớm nhất vào ngày 18.8.2012', N'UBND tỉnh Bình Định vừa có Quyết định ban hành Kế hoạch thời gian năm học 2012 - 2013 của giáo dục mầm non, giáo dục phổ thông và giáo dục thường xuyên trên địa bàn tỉnh Bình Định.
 

 

Theo kế hoạch, các trường THCS, THPT sẽ tựu trường sớm nhất vào ngày 18.8.2012 và giảng dạy chương trình của năm học mới từ ngày 20.8.2012. Các trường thuộc cấp học mầm non, tiểu học tựu trường vào ngày 25.8.2012 và giảng dạy chương trình của năm học mới từ ngày 27.8.2012. Đối với học sinh THCS và THPT hệ giáo dục thường xuyên tựu trường vào ngày 3.9.2012 và giảng dạy chương trình của năm học mới từ ngày 10.9.2012…

Ngày khai giảng năm học mới diễn ra từ ngày 3 đến ngày 5.9.2012. Ngày kết thúc học kỳ I muộn nhất là ngày 5.1.2013; kết thúc học kỳ II muộn nhất vào ngày 25.5.2013 và kết thúc năm học muộn nhất vào ngày 31.5.2013. Cũng theo kế hoạch này, trong năm học 2012-2013, học sinh Bình Định nghỉ Tết Nguyên đán ít nhất là 7 ngày.

XUÂN NGUYÊN

Theo Bình Định Online  (Cập nhật ngày 15-07-2012)', 1, 1, CAST(N'2017-09-09 20:15:06.000' AS DateTime), 1, N'hoc-sinh-tuu-truong', CAST(N'2017-09-09 00:00:00.000' AS DateTime), 1, N'')
INSERT [dbo].[Post] ([Id], [Title], [PContent], [AuthorId], [CategoryId], [DateCreated], [Active], [Slug], [DateModified], [ViewCount], [Image]) VALUES (3, N'Được mang máy tính Casio 570ES Plus vào phòng thi', N'TT - Những ngày qua, rất nhiều thí sinh thắc mắc về việc một vài loại máy tính cầm tay - trong đó có loại Casio 570 ES Plus - tuy đáp ứng yêu cầu của quy chế nhưng không có tên trong danh sách các loại máy tính cầm tay mà Bộ GD-ĐT đã công bố nên cán bộ coi thi không cho phép mang vào phòng thi.

Trao đổi với Tuổi Trẻ, ông Ngô Kim Khôi - phó vụ trưởng Vụ Giáo dục ĐH, phó ban chỉ đạo tuyển sinh - khẳng định: “Không chỉ có những loại máy tính liệt kê trong danh sách Bộ GD-ĐT đã công bố, các loại máy tính cầm tay khác đạt yêu cầu “không có chức năng soạn thảo văn bản (như tính năng ghi chép, ghi số điện thoại...), không có thẻ nhớ cắm thêm vào, là các loại máy tính cầm tay thông dụng làm được các phép tính số học, các phép tính lượng giác và các phép tính siêu việt” đều được sử dụng trong phòng thi".

Ông Khôi cũng cho rằng ngay trong thông báo của bộ đã có thêm câu... “và những loại máy tính có tính năng tương đương”, tức không chỉ giới hạn trong các loại máy tính có tên cụ thể trong danh sách này.

Ông Quách Tuấn Ngọc - cục trưởng Cục Công nghệ thông tin - khẳng định máy tính Casio 570 ES Plus đủ điều kiện sử dụng trong phòng thi. Theo ông Ngọc, loại máy tính này được bổ sung một số tính năng so với máy tính Casio 570 ES nhưng vẫn nằm trong phạm vi cho phép quy định được sử dụng của Bộ GD-ĐT.

Lịch thi tuyển sinh đại học đợt 2

 

Ngày

Buổi

Môn thi/thời gian làm bài

9-7

Sáng

Khối B

Khối C

Khối D

Sinh (7g15-8g45)

Ngữ văn (7g15-10g15)

Ngữ văn (7g15-10g15)

Chiều

Toán (14g15-17g15)

Lịch sử (14g15-17g15)

Toán (14g15-17g15)

10-7

Sáng

Hóa học (7g15-8g45)

Ðịa lý (7g15-10g15)

Ngoại ngữ (7g15-8g45)

Chiều

Dự trữ

 

THANH HÀ nguon: http://tuoitre.vn

', 1, 1, CAST(N'2017-09-15 00:00:00.000' AS DateTime), 1, N'duoc-mang-may-tinh', CAST(N'2017-09-09 00:00:00.000' AS DateTime), 0, N'post3.jpg')
INSERT [dbo].[Post] ([Id], [Title], [PContent], [AuthorId], [CategoryId], [DateCreated], [Active], [Slug], [DateModified], [ViewCount], [Image]) VALUES (4, N'Ông Trần Đức Minh, Giám đốc Sở GD-ĐT: Mọi thí sinh đều có quyền xin phúc khảo bài thi', N'<p style="text-align:justify">V&agrave;o l&uacute;c 16 giờ ng&agrave;y 4.6, Hội đồng chấm thi tốt nghiệp THPT năm 2012 đ&atilde; bắt đầu l&agrave;m việc. PV B&aacute;o B&igrave;nh Định đ&atilde; c&oacute; cuộc trao đổi với &ocirc;ng Trần Đức Minh, Gi&aacute;m đốc Sở GD-ĐT. ● C&ocirc;ng t&aacute;c chấm thi đ&atilde; được triển khai như thế n&agrave;o, thưa &ocirc;ng? &Ocirc;ng Trần Đức Minh. - Sở GD-ĐT đ&atilde; th&agrave;nh lập 1 hội đồng chấm thi đặt tại Trường THPT Quốc học (Quy Nhơn), gồm 1 chủ tịch, 5 ph&oacute; chủ tịch v&agrave; 4 thư k&yacute;. Tổng số gi&aacute;o vi&ecirc;n chấm thi l&agrave; 493 người, trong đ&oacute; chấm m&ocirc;n Ngữ văn 135 người, To&aacute;n 135 người, Địa l&yacute; 101 người v&agrave; Lịch sử 124 người. B&agrave;i thi trắc nghiệm của th&iacute; sinh sẽ được chấm bằng m&aacute;y v&agrave; phần mềm chuy&ecirc;n dụng. Sở GD-ĐT đ&atilde; ph&acirc;n c&ocirc;ng 5 c&aacute;n bộ phụ tr&aacute;ch phần chấm c&ugrave;ng 2 người gi&aacute;m s&aacute;t. Phụ tr&aacute;ch b&agrave;i thi tự luận c&oacute; bộ phận l&agrave;m ph&aacute;ch (8 người) v&agrave; c&aacute;c tổ bộ m&ocirc;n. Trước khi tiến h&agrave;nh chấm b&agrave;i, c&aacute;c tổ trưởng phải tổ chức cho c&aacute;c th&agrave;nh vi&ecirc;n trong tổ nghi&ecirc;n cứu kỹ văn bản hướng dẫn chấm thi của Bộ GD-ĐT, v&agrave; tiến h&agrave;nh chấm chung &iacute;t nhất 15 b&agrave;i để mọi người nhất qu&aacute;n c&aacute;ch chấm. Theo quy định của Bộ GD-ĐT, mỗi b&agrave;i thi tự luận phải được hai gi&aacute;m khảo chấm độc lập, ghi điểm ri&ecirc;ng theo số ph&aacute;ch v&agrave;o phiếu chấm điểm c&aacute; nh&acirc;n. Sau khi chấm xong, hai gi&aacute;m khảo sẽ b&agrave;n bạc để thống nhất số điểm chung cho b&agrave;i thi. Thời gian tiến h&agrave;nh cụ thể như sau: 16 giờ ng&agrave;y 4.6, Chủ tịch, c&aacute;c Ph&oacute; chủ tịch, thư k&yacute; v&agrave; bộ phận l&agrave;m m&atilde; ph&aacute;ch đối với c&aacute;c m&ocirc;n thi tự luận bắt đầu l&agrave;m việc tại Hội đồng chấm thi; nhận b&agrave;i thi tự luận v&agrave; b&agrave;i thi trắc nghiệm. Từ 7 giờ 30 ng&agrave;y 5.6, tổ xử l&yacute; b&agrave;i thi trắc nghiệm bắt đầu l&agrave;m việc. Ng&agrave;y 8.6, Chủ tịch, c&aacute;c Ph&oacute; chủ tịch, thư k&yacute;, tổ trưởng chấm thi c&aacute;c m&ocirc;n tự luận họp tại Sở GD-ĐT để nghi&ecirc;n cứu đ&aacute;p &aacute;n. Từ ng&agrave;y 9-15.6, gi&aacute;m khảo chấm thi c&aacute;c m&ocirc;n tự luận. Chậm nhất ng&agrave;y 18.6, Sở GD-ĐT sẽ sơ duyệt kết quả tốt nghiệp, c&ocirc;ng bố danh s&aacute;ch tốt nghiệp tạm thời. Trước ng&agrave;y 22.6, c&aacute;c trường THPT v&agrave; trực thuộc phải ho&agrave;n th&agrave;nh việc cấp giấy chứng nhận tốt nghiệp tạm thời, trả học bạ v&agrave; c&aacute;c loại giấy chứng nhận (bản ch&iacute;nh) cho th&iacute; sinh. ● C&ograve;n c&ocirc;ng t&aacute;c ph&uacute;c khảo th&igrave; sao, thưa &ocirc;ng? - Năm nay, mọi th&iacute; sinh đều c&oacute; quyền xin ph&uacute;c khảo b&agrave;i thi v&agrave; phải nộp lệ ph&iacute; ph&uacute;c khảo theo quy định. Trong thời hạn 7 ng&agrave;y kể từ ni&ecirc;m yết kết quả thi, nếu muốn ph&uacute;c khảo, th&iacute; sinh phải nộp đơn cho trường phổ th&ocirc;ng nơi nộp hồ sơ dự thi tốt nghiệp. Đối với b&agrave;i thi tự luận, khi chấm lại, ch&ecirc;nh lệch từ 1 điểm trở l&ecirc;n đối với m&ocirc;n Ngữ văn v&agrave; 0,5 điểm đối với c&aacute;c m&ocirc;n kh&aacute;c th&igrave; điểm ph&uacute;c khảo l&agrave; điểm mới của b&agrave;i thi. Với b&agrave;i thi trắc nghiệm, khi điểm chấm ch&ecirc;nh lệch với điểm chấm lần trước th&igrave; điểm ph&uacute;c khảo l&agrave; điểm mới. Từ 18.6 đến 23.6, c&aacute;c trường phổ th&ocirc;ng sẽ nhận đơn xin ph&uacute;c khảo b&agrave;i thi k&egrave;m theo học bạ của th&iacute; sinh. Từ ng&agrave;y 24.6 đến trước ng&agrave;y 27.6, hội đồng ph&uacute;c khảo sẽ l&agrave;m việc, sau đ&oacute; Sở GD-ĐT duyệt v&agrave; c&ocirc;ng bố kết quả ph&uacute;c khảo tạm thời. ● Xin cảm ơn &ocirc;ng! (Theo baobinhdinh.com.vn)</p>
', 1, 1, CAST(N'2017-09-09 20:15:06.000' AS DateTime), 1, N'ong-tran-uc-minh-giam-oc-so-gd-t-moi-thi-sinh-eu-co-quyen-xin-phuc-khao-bai-thi', CAST(N'2017-09-18 21:10:21.520' AS DateTime), 3, N'post4.jpg')
INSERT [dbo].[Post] ([Id], [Title], [PContent], [AuthorId], [CategoryId], [DateCreated], [Active], [Slug], [DateModified], [ViewCount], [Image]) VALUES (5, N'Tăng cường hoạt động thanh tra thi tốt nghiệp THPT', N'<p style="margin-left:0px; margin-right:0px; text-align:start">Cơn mưa k&eacute;o d&agrave;i k&egrave;m theo sấm chớp v&agrave; gi&oacute; giật mạnh xuất hiện l&uacute;c nửa đ&ecirc;m khiến nhiều tuyến đường ở S&agrave;i G&ograve;n biến th&agrave;nh s&ocirc;ng.</p>

<div class="cms-body the-article-body" style="-webkit-font-smoothing:antialiased; -webkit-text-stroke-width:0px; background:transparent; border:0px; box-sizing:border-box; color:#222222; float:left; font-family:&quot;Noto Serif&quot;,serif; font-size:18px; font-style:normal; font-variant-caps:normal; font-variant-ligatures:normal; font-weight:normal; letter-spacing:normal; line-height:30px; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; orphans:2; outline:0px; padding:0px; position:relative; text-align:start; text-decoration-color:initial; text-decoration-style:initial; text-indent:0px; text-rendering:geometricPrecision; text-size-adjust:100%; text-transform:none; vertical-align:baseline; white-space:normal; widows:2; width:660px; word-spacing:0px">
<div class="player" style="background:transparent; border:0px; box-sizing:border-box; font-size:18px; height:371px; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; outline:0px; padding:0px; position:relative; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px">
<div class="autoplay muted video" id="video75186" style="background:transparent; border:0px; box-sizing:border-box; font-size:18px; height:371px; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px">
<p style="margin-left:0px; margin-right:0px">&nbsp;</p>

<div style="-webkit-font-smoothing:antialiased; background:transparent; border:0px; box-sizing:border-box; font-family:Roboto,&quot;Open Sans&quot;,Arial,sans-serif; font-size:18px; font-style:normal; font-weight:400; height:371px; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; outline:0px; overflow:visible; padding:0px; position:relative; text-align:center; text-rendering:geometricPrecision; text-shadow:0px 0px 0px; text-size-adjust:100%; transform:translateZ(0px); user-select:none; vertical-align:baseline; width:660px">
<div class="pointer-enabled zcontainer" style="background:#000000; border:0px; box-sizing:inherit; cursor:auto; display:block; float:none; font-size:18px; height:371px; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; max-width:none; outline:0px; padding:0px; position:absolute; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px">
<div class="clickable player-poster" style="-webkit-box-align:center; -webkit-box-pack:center; align-items:center; background:none 50% 50% / cover no-repeat rgba(255, 255, 255, 0); border:0px; box-sizing:inherit; cursor:pointer; display:flex; float:none; font-size:18px; height:371px; justify-content:center; left:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; max-width:none; opacity:1; outline:0px; padding:0px; position:absolute; text-rendering:geometricPrecision; text-size-adjust:100%; top:0px; vertical-align:baseline; width:660px; z-index:10010 !important">
<div class="play-wrapper" style="background:transparent; border:0px; box-sizing:inherit; display:block; float:none; font-size:18px; height:231.875px; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; max-width:none; opacity:1; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; transition:opacity 0.1s ease; vertical-align:baseline; width:660px; z-index:10006">&nbsp;</div>
</div>
</div>

<div class="live media-control" style="background:transparent; border:0px; bottom:0px; box-sizing:inherit; display:block; float:none; font-size:18px; height:371px; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; max-width:none; outline:0px; overflow:hidden; padding:0px; pointer-events:none; position:absolute; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px; z-index:10012 !important">&nbsp;</div>
</div>
</div>
</div>

<p><strong><a class="autolink" href="http://news.zing.vn/video-sai-gon-mua-nhu-trut-nuoc-post780350.html" style="box-sizing: border-box; text-rendering: geometricPrecision; margin: 0px; padding: 0px; font-size: 12px; vertical-align: baseline; background: transparent; text-decoration: none; color: rgb(68, 68, 68);" target="_blank">S&agrave;i G&ograve;n mưa như tr&uacute;t nước</a></strong>&nbsp;Trận mưa lớn k&eacute;o d&agrave;i khoảng 2 giờ đồng hồ khiến nhiều tuyến đường ở TP.HCM biến th&agrave;nh s&ocirc;ng l&uacute;c nửa đ&ecirc;m.</p>

<p style="margin-left:0px; margin-right:0px">Khuya 17/9, mưa lớn bất ngờ đổ xuống c&aacute;c quận 1, 2, 3, 5, 7, 9, 12, B&igrave;nh Thạnh, G&ograve; Vấp, T&acirc;n B&igrave;nh, k&egrave;m theo sấm chớp v&agrave; lốc mạnh. Cơn mưa k&eacute;o d&agrave;i khoảng 2 giờ đồng hồ khiến nhiều tuyến đường ngập s&acirc;u trong nước.</p>

<table align="center" cellspacing="0" class="picture" style="-webkit-font-smoothing:antialiased; background:transparent; border-collapse:collapse; border-spacing:0px; border:0px; box-sizing:border-box; color:#555555; font-family:sans-serif; font-size:14px; line-height:20px; margin:14px 0px; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px">
	<tbody>
		<tr>
			<td style="vertical-align:baseline"><img alt="Duong pho Sai Gon thanh song sau tran mua nhieu gio luc nua dem hinh anh 1" src="http://znews-photo-td.zadn.vn/w660/Uploaded/zxgorz/2017_09_18/IMG_9294.jpg" style="background:transparent; border:0px; box-sizing:border-box; display:block; font-size:14px; height:auto; margin:0px; max-width:100%; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px" /></td>
		</tr>
		<tr>
			<td style="vertical-align:baseline">Mưa lớn khiến đường Nguyễn Th&aacute;i Sơn ngập s&acirc;u. Ảnh:&nbsp;<em>L&ecirc; Trai.</em></td>
		</tr>
	</tbody>
</table>

<p style="margin-left:0px; margin-right:0px">Theo ghi nhận của&nbsp;<em>Zing.vn</em>, c&aacute;c tuyến đường Phạm Văn Đồng, Nguyễn Th&aacute;i Sơn, Nguyễn Oanh, C&acirc;y Tr&acirc;m (quận G&ograve; Vấp), Phạm Ngũ L&atilde;o (quận 1), Phan Huy &Iacute;ch (T&acirc;n B&igrave;nh), nước kh&ocirc;ng kịp tho&aacute;t, g&acirc;y ngập nặng.</p>

<table align="center" cellspacing="0" class="picture" style="-webkit-font-smoothing:antialiased; background:transparent; border-collapse:collapse; border-spacing:0px; border:0px; box-sizing:border-box; color:#555555; font-family:sans-serif; font-size:14px; line-height:20px; margin:14px 0px; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px">
	<tbody>
		<tr>
			<td style="vertical-align:baseline"><img alt="Duong pho Sai Gon thanh song sau tran mua nhieu gio luc nua dem hinh anh 2" src="http://znews-photo-td.zadn.vn/w660/Uploaded/zxgorz/2017_09_18/IMG_9324.jpg" style="background:transparent; border:0px; box-sizing:border-box; display:block; font-size:14px; height:auto; margin:0px; max-width:100%; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px" /></td>
		</tr>
		<tr>
			<td style="vertical-align:baseline">Cả tuyến đường m&ecirc;nh m&ocirc;ng nước. Ảnh:<em>&nbsp;L&ecirc; Trai.</em></td>
		</tr>
	</tbody>
</table>

<p style="margin-left:0px; margin-right:0px">Tại đường Nguyễn Th&aacute;i Sơn (quận G&ograve; Vấp), nước ngập hơn 30 cm, tr&agrave;n l&ecirc;n vỉa h&egrave;. Nhiều xe cộ vất vả đi qua chỗ ngập. Một số xe chết m&aacute;y, dắt bộ trong đ&ecirc;m về nh&agrave; v&igrave; kh&ocirc;ng c&ograve;n thợ sửa xe. Nhiều xe cộ chạy nhanh khiến nước văng tung t&oacute;e l&agrave;m người đi đường ướt sũng.</p>

<p style="margin-left:0px; margin-right:0px">Theo Đ&agrave;i Kh&iacute; tượng Thủy văn Khu vực Nam Bộ đ&ecirc;m nay v&agrave; ng&agrave;y mai tại TP.HCM sẽ xuất hiện mưa r&agrave;o v&agrave; d&ocirc;ng rải r&aacute;c. Trong cơn mưa, người d&acirc;n cần đề ph&ograve;ng gi&oacute; giật mạnh v&agrave; lốc xo&aacute;y.</p>

<table align="center" cellspacing="0" class="picture" style="-webkit-font-smoothing:antialiased; background:transparent; border-collapse:collapse; border-spacing:0px; border:0px; box-sizing:border-box; color:#555555; font-family:sans-serif; font-size:14px; line-height:20px; margin:14px 0px; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px">
	<tbody>
		<tr>
			<td style="vertical-align:baseline"><img alt="Duong pho Sai Gon thanh song sau tran mua nhieu gio luc nua dem hinh anh 3" src="http://znews-photo-td.zadn.vn/w660/Uploaded/zxgorz/2017_09_18/IMG_9284.jpg" style="background:transparent; border:0px; box-sizing:border-box; display:block; font-size:14px; height:auto; margin:0px; max-width:100%; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px" /></td>
		</tr>
		<tr>
			<td style="vertical-align:baseline">Nhiều người tăng ga khiến nước văng tung t&oacute;e. Ảnh:&nbsp;<em>L&ecirc; Trai.</em></td>
		</tr>
	</tbody>
</table>

<p style="margin-left:0px; margin-right:0px">S&aacute;ng 18/9, &ocirc;ng L&ecirc; Đ&igrave;nh Quyết, Ph&oacute; ph&ograve;ng Kh&iacute; tượng Thuỷ văn Khu vực Nam Bộ, cho biết đ&ecirc;m qua TP.HCM c&oacute; một số nơi mưa rất to, k&egrave;m d&ocirc;ng s&eacute;t l&agrave; do ảnh hưởng của gi&oacute; m&ugrave;a T&acirc;y Nam c&oacute; cường độ yếu đến trung b&igrave;nh v&agrave; tr&ecirc;n cao l&agrave; ho&agrave;n lưu của &aacute;p cao cận nhiệt đới. Ri&ecirc;ng khu vực miền Đ&ocirc;ng Nam Bộ c&ograve;n chịu t&aacute;c động kết hợp của hội tụ gi&oacute; tr&ecirc;n mực 1500-3000 m.</p>

<p style="margin-left:0px; margin-right:0px">&quot;Qu&aacute; tr&igrave;nh lấn t&acirc;y của &aacute;p cao cận nhiệt đới, đẩy ẩm từ ngo&agrave;i biển v&agrave;o đất liền, tạo n&ecirc;n sự bất ổn định mạnh trong kh&iacute; quyển (tầng đối lưu) l&agrave; nguy&ecirc;n nh&acirc;n ch&iacute;nh dẫn đến mưa to, d&ocirc;ng, s&eacute;t&quot;, &ocirc;ng Quyết giải th&iacute;ch v&agrave; cho biết lượng mưa đ&ecirc;m qua đo được tại c&aacute;c trạm kh&iacute; tượng Củ Chi l&agrave; 50,10 mm; quận 12 l&agrave; 25,10 mm; quận 8 l&agrave; 36,50 mm.</p>
</div>
', 1, 1, CAST(N'2017-09-03 11:24:15.000' AS DateTime), 1, N'tang-cuong-hoat-ong-thanh-tra-thi-tot-nghiep-thpt', CAST(N'2017-09-18 18:39:59.407' AS DateTime), 6, N'post5.jpg')
INSERT [dbo].[Post] ([Id], [Title], [PContent], [AuthorId], [CategoryId], [DateCreated], [Active], [Slug], [DateModified], [ViewCount], [Image]) VALUES (21, N'Xin chào', N'<h1 style="text-align:center"><span style="color:#2ecc71"><strong>B&agrave;i Giới Thiệu Bản Th&acirc;n </strong></span></h1>

<blockquote>
<p><span style="font-size:14px">xin ch&agrave;o mn, t&ocirc;i t&ecirc;n l&agrave; Huỳnh <a href="http://google.com">Ngọc Thắng</a> <img alt="laugh" src="http://localhost:8080/thpthoabinh/resources/editor/plugins/smiley/images/teeth_smile.png" style="height:23px; width:23px" title="laugh" /><img alt="cheeky" src="http://localhost:8080/thpthoabinh/resources/editor/plugins/smiley/images/tongue_smile.png" style="height:23px; width:23px" title="cheeky" /><img alt="wink" src="http://localhost:8080/thpthoabinh/resources/editor/plugins/smiley/images/wink_smile.png" style="height:23px; width:23px" title="wink" /></span></p>

<p><span style="font-size:14px">Sở th&iacute;ch: code, ăn, chơi, ngủ, nghỉ</span></p>
</blockquote>

<p>&nbsp;</p>

<table border="1" cellpadding="1" cellspacing="1" style="height:158px; width:847px">
	<tbody>
		<tr>
			<td style="text-align:center"><strong>Thứ 2</strong></td>
			<td style="text-align:center"><strong>Thứ 3</strong></td>
			<td style="text-align:center"><strong>Thứ 4</strong></td>
			<td style="text-align:center"><strong>Thứ 5</strong></td>
			<td style="text-align:center"><strong>Thứ 6</strong></td>
			<td style="text-align:center"><strong>Thứ 7</strong></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p style="text-align:justify">THIS IS CONTENT Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur praesentium sed ipsum error quibusdam voluptatibus aspernatur voluptas nostrum libero, optio sunt similique obcaecati enim eius tempore accusantium! Labore magni assumenda sequi, doloribus iusto, fugit nulla, qui maxime cum voluptate aliquid ut enim a quibusdam corporis fugiat molestias. Maxime dignissimos facere, voluptas ducimus sit saepe eveniet, fugiat minus distinctio ut provident, esse nemo obcaecati rem voluptate tempore. Quasi nostrum provident sed illo amet at ipsam exercitationem facilis minus, laudantium natus dolor, in saepe nobis ratione itaque temporibus hic, recusandae veniam assumenda eius. Laboriosam sunt illo nesciunt quaerat vitae voluptatibus impedit exercitationem dolorum fuga a aliquid, ut recusandae, magnam pariatur. Soluta quae recusandae temporibus consequuntur fugit minus quisquam, nobis voluptatibus repellendus architecto! Blanditiis veniam ab quae maiores accusamus perferendis omnis dolorem quas quaerat ipsum esse quis aspernatur quibusdam ducimus, dolor voluptatum porro aliquid tempora cupiditate optio eius. Suscipit sed reprehenderit laboriosam veritatis sunt voluptatem maiores aliquam dolor vitae tempore. Nisi consequuntur voluptate error, deleniti laudantium. Iste inventore labore ducimus id, laborum esse, tempora itaque accusantium, dolores atque voluptatum facilis odit vel rem qui? Facere et, nisi inventore ullam sint commodi expedita quos quaerat, dolor dolores facilis architecto eligendi quis aliquid qui hic quidem! Voluptatem doloribus laudantium ipsa minus quod numquam dolores delectus ea asperiores magnam. Eligendi natus, ex voluptatibus impedit, assumenda quod, exercitationem, harum id suscipit expedita ratione. Molestias voluptas commodi, quasi voluptatem expedita aspernatur totam hic, quod id exercitationem sequi cumque officia iusto ad dolore modi excepturi ratione dolores optio iste laborum. Repellat ex officia, est ipsa hic architecto natus qui perspiciatis soluta veniam numquam, iusto cupiditate assumenda eaque commodi! Ipsa enim doloremque nemo ducimus ullam libero possimus dolor odit. Delectus incidunt eveniet, iste ipsa temporibus vel omnis possimus quae inventore nesciunt quia est at expedita repudiandae debitis accusantium, odit dolores aut dolore provident ducimus placeat. Vel, reiciendis incidunt soluta officia libero rem earum tempora. Sint dolor voluptas harum vero, perspiciatis, beatae pariatur labore aspernatur nulla exercitationem aperiam ad atque illum laudantium, dolorem laboriosam dignissimos officiis qui eos velit aliquam, explicabo iure! Maxime deserunt placeat ratione, alias vitae autem. Autem molestiae nisi distinctio, consectetur, doloremque fugit debitis totam ducimus. Sint optio consectetur impedit distinctio, magni molestias praesentium iusto reprehenderit odit pariatur, perspiciatis rem. Molestias consequuntur fugiat, possimus fuga? Iure, facere nostrum? Cupiditate perferendis doloribus unde aliquam molestias incidunt quo esse. Ipsum cum, totam laboriosam hic quo a doloribus, qui dolore ad quam temporibus ea! Itaque, quo distinctio ratione eius molestias porro minima architecto laboriosam harum non sed nam doloribus ipsam a blanditiis atque repellendus, nesciunt unde id! Soluta voluptas, fugit. Fugiat aliquid dolore, ad facere aliquam sapiente nihil consequuntur, saepe, quidem distinctio delectus facilis. Illum odit praesentium, et quasi cum, excepturi? Culpa itaque amet assumenda minus quos perferendis doloremque, eos ad, ducimus recusandae voluptate vero, suscipit libero optio repellat quidem quisquam architecto, temporibus eligendi! Nihil in maxime aliquid labore, molestiae qui veritatis. Rerum doloribus quo, ab, maiores delectus provident, laudantium ratione voluptates repellendus consectetur voluptas animi minus saepe error</p>
', 1, 1, CAST(N'2017-09-18 21:29:58.193' AS DateTime), 1, N'xin-chao', CAST(N'2017-09-21 17:57:41.087' AS DateTime), 30, N'IMGDBB6AF77D2')
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[UserDetail] ON 

INSERT [dbo].[UserDetail] ([Id], [Username], [Password], [FullName], [Role], [Active], [Email], [Phone], [Profile], [Image]) VALUES (1, N'ngocthang', N'$2a$06$JmK3lWa54pXUwxFXpWx10.NOYsE1Dr0qln6c76dXsQfbkprBJ2kym', N'Huỳnh Ngọc Thắng', N'ADMIN', 1, N'ngocthanguit@gmail.com', N'0972516794', N'H?c sinh t?i tru?ng THPT Hòa Bình', N'thang.jpg')
INSERT [dbo].[UserDetail] ([Id], [Username], [Password], [FullName], [Role], [Active], [Email], [Phone], [Profile], [Image]) VALUES (2, N'test', N'$2a$06$JmK3lWa54pXUwxFXpWx10.NOYsE1Dr0qln6c76dXsQfbkprBJ2kym', N't', N'USER', 1, N't@gmail.com', N'484747', N'hoc sinh', N't.jpg')
SET IDENTITY_INSERT [dbo].[UserDetail] OFF
USE [master]
GO
ALTER DATABASE [HoaBinh] SET  READ_WRITE 
GO
