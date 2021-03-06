USE [master]
GO
/****** Object:  Database [HoaBinh]    Script Date: 9/17/2017 12:27:51 PM ******/
CREATE DATABASE [HoaBinh]
GO
USE [HoaBinh]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/17/2017 12:27:51 PM ******/
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
/****** Object:  Table [dbo].[Post]    Script Date: 9/17/2017 12:27:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[PContent] [nvarchar](4000) NULL,
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
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 9/17/2017 12:27:51 PM ******/
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
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Title], [PContent], [AuthorId], [CategoryId], [DateCreated], [Active], [Slug], [DateModified], [ViewCount], [Image]) VALUES (1, N'Thông cáo số 1 về kỳ thi tốt nghiệp THPT năm 2012', N'Kỳ thi tốt nghiệp
THPT năm 2012 được tổ chức trong các ngày 02,03 và 04/6/2012. Cho đến thời điểm hiện tại, công tác chuẩn bị cho kỳ thi về cơ bản đã hoàn tất. Các địa phương trên toàn quốc đã tích cực chuẩn bị các điều kiện tổ chức thi, hướng dẫn cho thí sinh đăng ký dự thi đảm bảo quy định của Quy chế, các phương án dự phòng cũng đã được triển khai. Theo báo cáo từ các đơn vị, số liệu của Kỳ thi được tổng hợp như sau: 1. Tổng số thí sinh đăng ký dự thi: 963.571. Trong đó, có: - 856.271 thí sinh GD THPT. - 107.300 thí sinh GDTX. 2. Tổng số phòng thi: 40.620. 3. Tổng số Hội đồng coi thi: 2.307. 4. Số cán bộ giáo viên tham gia coi thi: 124.153. 5. Số cán bộ giáo viên tham gia chấm thi: 27.472. Cục Khảo thí và Kiểm định chất lượng giáo dục trân trọng thông báo./. Nơi nhận: - Các cơ quan thông tấn báo chí; - Ban Chỉ đạo thi Phổ thông Trung ương; - Lưu: VP Cục. CỤC TRƯỞNG (đã ký) Ngô Kim Khôi nguồn:http://www.moet.gov.vn/?page=1.29&view=4175', 1, 1, CAST(N'2017-09-03 11:24:15.000' AS DateTime), 1, N'thaang-caao-saaa-1-vaaa-kaaa-thi-taaat-nghiaaap-thpt-naam-2013', CAST(N'2017-09-17 11:27:27.077' AS DateTime), 0, N'post1.jpg')
INSERT [dbo].[Post] ([Id], [Title], [PContent], [AuthorId], [CategoryId], [DateCreated], [Active], [Slug], [DateModified], [ViewCount], [Image]) VALUES (2, N'Học sinh tựu trường sớm nhất vào ngày 18.8.2012', N'UBND tỉnh Bình Định vừa có Quyết định ban hành Kế hoạch thời gian năm học 2012 - 2013 của giáo dục mầm non, giáo dục phổ thông và giáo dục thường xuyên trên địa bàn tỉnh Bình Định.
 

 

Theo kế hoạch, các trường THCS, THPT sẽ tựu trường sớm nhất vào ngày 18.8.2012 và giảng dạy chương trình của năm học mới từ ngày 20.8.2012. Các trường thuộc cấp học mầm non, tiểu học tựu trường vào ngày 25.8.2012 và giảng dạy chương trình của năm học mới từ ngày 27.8.2012. Đối với học sinh THCS và THPT hệ giáo dục thường xuyên tựu trường vào ngày 3.9.2012 và giảng dạy chương trình của năm học mới từ ngày 10.9.2012…

Ngày khai giảng năm học mới diễn ra từ ngày 3 đến ngày 5.9.2012. Ngày kết thúc học kỳ I muộn nhất là ngày 5.1.2013; kết thúc học kỳ II muộn nhất vào ngày 25.5.2013 và kết thúc năm học muộn nhất vào ngày 31.5.2013. Cũng theo kế hoạch này, trong năm học 2012-2013, học sinh Bình Định nghỉ Tết Nguyên đán ít nhất là 7 ngày.

XUÂN NGUYÊN

Theo Bình Định Online  (Cập nhật ngày 15-07-2012)', 1, 1, CAST(N'2017-09-09 20:15:06.000' AS DateTime), 1, N'hoc-sinh-tuu-truong', CAST(N'2017-09-09 00:00:00.000' AS DateTime), 0, N'post2.jpg')
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
INSERT [dbo].[Post] ([Id], [Title], [PContent], [AuthorId], [CategoryId], [DateCreated], [Active], [Slug], [DateModified], [ViewCount], [Image]) VALUES (4, N'Ông Trần Đức Minh, Giám đốc Sở GD-ĐT: Mọi thí sinh đều có quyền xin phúc khảo bài thi', N'Vào lúc 16 giờ ngày 4.6, Hội đồng chấm thi tốt nghiệp THPT năm 2012 đã bắt đầu làm việc. PV Báo Bình Định đã có cuộc trao đổi với ông Trần Đức Minh, Giám đốc Sở GD-ĐT. ● Công tác chấm thi đã được triển khai như thế nào, thưa ông? Ông Trần Đức Minh. - Sở GD-ĐT đã thành lập 1 hội đồng chấm thi đặt tại Trường THPT Quốc học (Quy Nhơn), gồm 1 chủ tịch, 5 phó chủ tịch và 4 thư ký. Tổng số giáo viên chấm thi là 493 người, trong đó chấm môn Ngữ văn 135 người, Toán 135 người, Địa lý 101 người và Lịch sử 124 người. Bài thi trắc nghiệm của thí sinh sẽ được chấm bằng máy và phần mềm chuyên dụng. Sở GD-ĐT đã phân công 5 cán bộ phụ trách phần chấm cùng 2 người giám sát. Phụ trách bài thi tự luận có bộ phận làm phách (8 người) và các tổ bộ môn. Trước khi tiến hành chấm bài, các tổ trưởng phải tổ chức cho các thành viên trong tổ nghiên cứu kỹ văn bản hướng dẫn chấm thi của Bộ GD-ĐT, và tiến hành chấm chung ít nhất 15 bài để mọi người nhất quán cách chấm. Theo quy định của Bộ GD-ĐT, mỗi bài thi tự luận phải được hai giám khảo chấm độc lập, ghi điểm riêng theo số phách vào phiếu chấm điểm cá nhân. Sau khi chấm xong, hai giám khảo sẽ bàn bạc để thống nhất số điểm chung cho bài thi. Thời gian tiến hành cụ thể như sau: 16 giờ ngày 4.6, Chủ tịch, các Phó chủ tịch, thư ký và bộ phận làm mã phách đối với các môn thi tự luận bắt đầu làm việc tại Hội đồng chấm thi; nhận bài thi tự luận và bài thi trắc nghiệm. Từ 7 giờ 30 ngày 5.6, tổ xử lý bài thi trắc nghiệm bắt đầu làm việc. Ngày 8.6, Chủ tịch, các Phó chủ tịch, thư ký, tổ trưởng chấm thi các môn tự luận họp tại Sở GD-ĐT để nghiên cứu đáp án. Từ ngày 9-15.6, giám khảo chấm thi các môn tự luận. Chậm nhất ngày 18.6, Sở GD-ĐT sẽ sơ duyệt kết quả tốt nghiệp, công bố danh sách tốt nghiệp tạm thời. Trước ngày 22.6, các trường THPT và trực thuộc phải hoàn thành việc cấp giấy chứng nhận tốt nghiệp tạm thời, trả học bạ và các loại giấy chứng nhận (bản chính) cho thí sinh. ● Còn công tác phúc khảo thì sao, thưa ông? - Năm nay, mọi thí sinh đều có quyền xin phúc khảo bài thi và phải nộp lệ phí phúc khảo theo quy định. Trong thời hạn 7 ngày kể từ niêm yết kết quả thi, nếu muốn phúc khảo, thí sinh phải nộp đơn cho trường phổ thông nơi nộp hồ sơ dự thi tốt nghiệp. Đối với bài thi tự luận, khi chấm lại, chênh lệch từ 1 điểm trở lên đối với môn Ngữ văn và 0,5 điểm đối với các môn khác thì điểm phúc khảo là điểm mới của bài thi. Với bài thi trắc nghiệm, khi điểm chấm chênh lệch với điểm chấm lần trước thì điểm phúc khảo là điểm mới. Từ 18.6 đến 23.6, các trường phổ thông sẽ nhận đơn xin phúc khảo bài thi kèm theo học bạ của thí sinh. Từ ngày 24.6 đến trước ngày 27.6, hội đồng phúc khảo sẽ làm việc, sau đó Sở GD-ĐT duyệt và công bố kết quả phúc khảo tạm thời. ● Xin cảm ơn ông! (Theo baobinhdinh.com.vn)', 1, 1, CAST(N'2017-09-09 20:15:06.000' AS DateTime), 1, NULL, CAST(N'2017-09-09 00:00:00.000' AS DateTime), 2, N'post4.jpg')
INSERT [dbo].[Post] ([Id], [Title], [PContent], [AuthorId], [CategoryId], [DateCreated], [Active], [Slug], [DateModified], [ViewCount], [Image]) VALUES (5, N'Dự kiến điểm chuẩn đh Bách khoa TP HCM năm 2011', N'This is content', 1, 1, CAST(N'2017-09-03 11:24:15.000' AS DateTime), 1, NULL, CAST(N'2017-09-17 11:27:27.077' AS DateTime), 0, N'post5.jpg')
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[UserDetail] ON 

INSERT [dbo].[UserDetail] ([Id], [Username], [Password], [FullName], [Role], [Active], [Email], [Phone], [Profile], [Image]) VALUES (1, N'ngocthang', N'$2a$06$JmK3lWa54pXUwxFXpWx10.NOYsE1Dr0qln6c76dXsQfbkprBJ2kym', N'Huỳnh Ngọc Thắng', N'ADMIN', 1, N'ngocthanguit@gmail.com', N'0972516794', N'H?c sinh t?i tru?ng THPT Hòa Bình', N'thang.jpg')
INSERT [dbo].[UserDetail] ([Id], [Username], [Password], [FullName], [Role], [Active], [Email], [Phone], [Profile], [Image]) VALUES (2, N'test', N'$2a$06$JmK3lWa54pXUwxFXpWx10.NOYsE1Dr0qln6c76dXsQfbkprBJ2kym', N't', N'USER', 1, N't@gmail.com', N'484747', N'hoc sinh', N't.jpg')
SET IDENTITY_INSERT [dbo].[UserDetail] OFF
USE [master]
GO
ALTER DATABASE [HoaBinh] SET  READ_WRITE 
GO
