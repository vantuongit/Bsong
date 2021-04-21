-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2021 at 10:16 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bsong`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Nhạc trẻ\r\n'),
(2, 'Nhạc trữ tình\r\n'),
(3, 'Rap Việt'),
(30, 'nhạc vàng'),
(44, 'Nhạc Cách Mạng'),
(45, 'Nhạc Pop'),
(46, 'Nhạc Trịnh'),
(47, 'Nhạc Bolero'),
(48, 'Nhạc Thiếu Nhi');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `website`, `message`) VALUES
(1, 'Nguyễn Văn A\r\n', 'nguyenvana@gmail.com\r\n', 'http://vinaenter.edu.vn\r\n', 'Website cần hoàn thiện hơn nữa\r\n'),
(2, 'Trần Văn B\r\n', 'tranvanb@gmail.com\r\n', 'http://vinaenter.edu.vn\r\n', 'Admin đẹp trai lắm\r\n'),
(4, 'Tình Nồng', 'vantuongktdt@gmail.com', 'yenvo.vn', 'hihi'),
(8, 'Tình Nồng', '', '', ''),
(11, 'Tưởng123', 'vantuongktdt@gmail.com', 'yenvo.vn', 'nhạc hay');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cat_id` int(11) NOT NULL,
  `picture` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `name`, `preview_text`, `detail_text`, `date_create`, `cat_id`, `picture`, `counter`) VALUES
(10, 'Kiếp ve sầu', 'Từ khi em không còn về quanh sân\r\nLà lần con phố nghe hoang vắng vô cùng', 'Từ khi em không còn về quanh sân\r\nLà lần con phố nghe hoang vắng vô cùng\r\nNgàn ánh nắng lấp lánh bước theo em đang biến nơi nào\r\nNgày chia ly không còn gì trong tay\r\nChỉ còn nỗi nhớ với anh suốt đêm dài\r\nCó con sóng ngoài khơi tràn vào thuyền anh cuốn đi rồi\r\nNhững ước mơ sau cùng\r\nNgày chia tay anh một đời rêu phong\r\nMột lần sau cuối cho anh thấy mặt người\r\nCuộc sống vẫn tiếp nối vắng xa nhau anh anh sống vô chừng\r\nCòn gì đâu khi dòng đời chia hai\r\nChỉ còn nước mắt ôm anh đến muôn đời\r\nNhững đêm tối triền miên\r\nCòn một mình anh tiếc thương hoài\r\nNhững dấu yêu trong đời\r\nAnh yêu em yêu say đắm\r\nKhông cần toan tính nghĩ suy làm chi\r\nAnh yêu em sao chua xót lãng quên tháng năm\r\nChờ ngày em đến tiếng hát vút cao\r\nChỉ còn tia nắng ấm áp bên đời\r\nCùng ngàn mây trắng lững lờ vút cao bay lên chốn xa\r\nMột ngày em đến góc phố hát ca\r\nTừng đàn chim én chúm chím môi cười\r\nLà đời anh bớt mệt nhoài\r\nHát rong trong kiếp ve sầu\r\nNgày chia tay anh một đời rêu phong\r\nMột lần sau cuối cho anh thấy mặt người\r\nCuộc sống vẫn tiếp nối vắng xa nhau anh anh sống vô chừng\r\nCòn gì đâu khi dòng đời chia hai\r\nChỉ còn nước mắt ôm anh đến muôn đời\r\nNhững đêm tối triền miên\r\nCòn một mình anh tiếc thương hoài\r\nNhững dấu yêu trong đời\r\nAnh yêu em yêu say đắm\r\nKhông cần toan tính nghĩ suy làm chi\r\nAnh yêu em sao chua xót lãng quên tháng năm\r\nChờ ngày em đến tiếng hát vút cao\r\nChỉ còn tia nắng ấm áp bên đời\r\nCùng ngàn mây trắng lững lờ vút cao bay lên chốn xa\r\nMột ngày em đến góc phố hát ca\r\nTừng đàn chim én chúm chím môi cười\r\nLà đời anh bớt mệt nhoài\r\nHát rong trong kiếp ve sầu\r\nChờ ngày em đến tiếng hát vút cao\r\nChỉ còn tia nắng ấm áp bên đời\r\nCùng ngàn mây trắng lững lờ vút cao bay lên chốn xa\r\nMột ngày em đến góc phố hát ca\r\nTừng đàn chim én chúm chím môi cười\r\nLà đời anh bớt mệt nhoài\r\nHát rong trong kiếp ve sầu', '2021-01-22 13:53:22', 1, '111956481_1601763659995989_823067657535618351_o-236306760965700.jpg', 5),
(16, 'Vì Ngày Hôm Nay Em Cưới Rồi', 'Vì ngày hôm nay em cưới rồi vụn vỡ vết thương đau mãi trong tim\r\nNgười đàn ông may mắn ấy từ nay đã có em', 'Muốn đi vài hôm xa chính nơi ta từng có phút êm đềm\r\nTrước ngày giống tố đến tìm\r\nĐến khi nhận ra nên quý hơn những ngày tháng sống bên nhau\r\n\r\nThì mình muộn mất rồi!\r\nGiờ này em có lẽ rất vui, cùng người em yêu chung bước không quay lại nhìn\r\nDù sao thì anh cũng mong em luôn bình yên\r\nVà xin lỗi vì không đến chúc phúc cho em!\r\n\r\nĐk:\r\nVì ngày hôm nay em cưới rồi vụn vỡ vết thương đau mãi trong tim\r\nNgười đàn ông may mắn ấy từ nay đã có em\r\nVẫn muốn đến đây gặp em một lần để thấy em hạnh phúc thế nào rồi anh đi\r\n\r\nVì ngày hôm nay em cưới rồi\r\nMai sau anh sống thế nào\r\nMột người đã mang cả thế giới sánh đôi với tình yêu mới\r\nNgày em đẹp nhất trên đời là ngày chúng ta xa mãi 1 người\r\nNợ duyên đến nay mình trả hết rồi!\r\n\r\nĐk cuối:\r\nDù có một đời anh cố gắng thì vẫn không sao giữ em\r\nMột người đã mang cả thế giới sánh đôi với tình yêu mới.', '2021-01-20 08:25:10', 2, 'hqdefault-236364303296000.jpg', 3),
(17, 'Đi Về Nhà', 'Đường về nhà là vào tim ta\r\nDẫu nắng mưa gần xa\r\nThất bát, vang danh', 'Đường về nhà là vào tim ta\r\nDẫu nắng mưa gần xa\r\nThất bát, vang danh\r\nNhà vẫn luôn chờ ta\r\nĐường về nhà là vào tim ta\r\nDẫu có muôn trùng qua\r\nVận đỗi sao dời\r\nNhà vẫn luôn là nhà\r\n\r\nLao vào đời để kiếm cơm, lao vào đời tìm cơ hội\r\nTiếng thành thị thường lấp lánh, đêm thành thị thường trơ trọi\r\nNhư mọi đứa trẻ khác, lớn lên muốn đi xa hoài\r\nNhà thì vẫn ở yên đó, đợi những đứa con đang ra ngoài\r\nBước ra ngoài rồi mới biết, không ở đâu bằng ở nhà\r\nBước có gì để mắt trước khi sẵn sàng mở quà\r\nKhông phải là võ sĩ nhưng mà phải giỏi đấu đá\r\nNhiều khi kiệt sức chỉ vì gắng giữ mình không xấu xa\r\nĐôi lúc bỗng thấy đồng cảm với Mai An Tiêm\r\nBước chân ra là sóng gió, chỉ có nhà mãi an yên\r\nNgoài kia phức tạp như rễ má và dây mơ\r\nVề nhà để có lúc cho phép mình được ngây thơ\r\nMang theo bao náo nức lên chiếc xe này\r\nTrọn một niềm thao thức suốt những đêm ngày\r\nCùng dòng người trên phố mang sắc mai hương đào\r\nTìm về nơi ấm êm\r\n\r\nĐường về nhà là vào tim ta\r\nDẫu nắng mưa gần xa\r\nThất bát, vang danh\r\nNhà vẫn luôn chờ ta\r\nĐường về nhà là vào tim ta\r\nDẫu có muôn trùng qua\r\nVậ đỗi sao dời\r\nNhà vẫn luôn là nhà\r\n\r\nVề ngôi nhà có góc vườn nhiều chó nhiều gà\r\nĐám bạn nói con khó chiều\r\nVà lại thích gió trời hơn gió điều hòa\r\nVề ăn cơm mẹ nấu, về mặc áo mẹ may\r\nVề đưa ba ra chợ mua cây đào cây mai về bày\r\nCả năm trời làm việc nhiều khi rã rời như cái máy\r\nVề nhà thấy áp lục nhẹ như bấc thổi cái là bay\r\nẤm êm hơn bếp lửa, ngọt bùi hơn lúa non\r\nNhà vẫn luôn ở đó, mong chờ những đứa con\r\nDẫu cho mưa cho nắng vẫn không bao giờ nề hà\r\nHạnh phúc chỉ đơn giản là còn được về nhà\r\nHạnh phúc, đi về nhà\r\nCô đơn đi về nhà\r\nThành công, đi về nhà\r\nThất bại, đi về nhà\r\nMệ quá, đi về nhà\r\nMông lung đi về nhà\r\nChênh vênh, đi về nhà\r\nKhông có việc gì vậy thì đi về nhà\r\nĐi về nhà, đi về nhà,...\r\n\r\nĐường về nhà là vào tim ta\r\nDẫu nắng mưa gần xa\r\nThất bát, vang danh\r\nNhà vẫn luôn chờ ta\r\nĐường về nhà là vào tim ta\r\nDẫu có muôn trùng qua\r\nVậ đỗi sao dời\r\nNhà vẫn luôn là nhà\r\n\r\nNhà có thể lớn có thể nhỏ, có thể không khang trang\r\nCha mẹ nào cũng muốn con được sống đàng hoàng\r\nLớn lên làm người mong một tương lai xán lạn\r\nCặm cụi cả đời không bao giờ thấy than van\r\n\r\nĐường về nhà là vào tim ta\r\nDẫu nắng mưa gần xa\r\nThất bát, vang danh\r\nNhà vẫn luôn chờ ta\r\nĐường về nhà là vào tim ta\r\nDẫu có muôn trùng qua\r\nVậ đỗi sao dời\r\nNhà vẫn luôn là nhà', '2021-01-20 08:44:57', 3, 'nkk2664-1608348105952437410015-236349232826300.jpg', 11),
(20, 'Bán Duyên', 'Đời người con gái đẹp nhất tuổi trăng tròn\r\nSao anh vẫn thấy em buồn', 'Đời người con gái đẹp nhất tuổi trăng tròn\r\nSao anh vẫn thấy em buồn\r\nVì em buộc trao người em chưa từng yêu thương\r\nChuyện người sơn nữ tựa như ánh trăng hiền\r\nNhưng phảng phất nỗi ưu phiền\r\nLàm say làm mê lòng trai tráng khắp miền\r\nMẹ cha tham sang mang em bán bên làng\r\nCho người không biết thương nàng\r\nChỉ mong ở bên nàng vui đùa thân xác\r\nGiọt lệ rơi trong đêm chăn gối phũ phàng\r\nThương cho thân xác hoa tàn\r\nTuổi trăng tròn em nhiều cay đắng bẽ bàng\r\nĐời người con gái chỉ mong ở bên người\r\nMình yêu nhất trên đời\r\nCớ sao mấy người\r\nLại mang nàng đi về nơi xa xôi\r\nTội nghiệp em lắm người ta có yêu gì\r\nNgoài thân xác mĩ miều\r\nĐể lại bao vết thương trong lòng\r\nKhóc trong vô vọng\r\nĐời em từng đẹp tựa như đóa hoa hồng\r\nNay như chim cá trong lồng\r\nChỉ mong được chơi đùa vui cùng khoảng không\r\nGiờ đây lạnh căm ở nơi chốn khuê phòng\r\nMà tan nát cõi lòng\r\nTrần gian có biết em sợ cuộc sống bao người mong\r\nMẹ cha tham sang mang em bán bên làng\r\nCho người không biết thương nàng\r\nChỉ mong ở bên nàng vui đùa thân xác\r\nGiọt lệ rơi trong đêm chăn gối phũ phàng\r\nThương cho thân xác hoa tàn\r\nTuổi trăng tròn em nhiều cay đắng bẽ bàng\r\nĐời người con gái chỉ mong ở bên người\r\nMình yêu nhất trên đời\r\nCớ sao mấy người\r\nLại mang nàng đi về nơi xa xôi\r\nTội nghiệp em lắm người ta có yêu gì\r\nNgoài thân xác mĩ miều\r\nĐể lại bao vết thương trong lòng\r\nKhóc trong vô vọng\r\nĐời em từng đẹp tựa như đóa hoa hồng\r\nNay như chim cá trong lồng\r\nChỉ mong được chơi đùa vui cùng khoảng không\r\nGiờ đây lạnh căm ở nơi chốn khuê phòng\r\nMà tan nát cõi lòng\r\nTrần gian có biết em sợ cuộc sống bao người mong\r\nĐời người con gái chỉ mong ở bên người\r\nMình yêu nhất trên đời\r\nCớ sao mấy người\r\nLại mang nàng đi về nơi xa xôi\r\nTội nghiệp em lắm người ta có yêu gì\r\nNgoài thân xác mĩ miều\r\nĐể lại bao vết thương trong lòng\r\nKhóc trong vô vọng\r\nĐời em từng đẹp tựa như đóa hoa hồng\r\nNay như chim cá trong lồng\r\nChỉ mong được chơi đùa vui cùng khoảng không\r\nGiờ đây lạnh căm ở nơi chốn khuê phòng\r\nMà tan nát cõi lòng\r\nTrần gian có biết em sợ cuộc sống bao người mong\r\nTrần gian có biết em sợ cuộc sống bao người mong', '2021-01-23 14:29:57', 1, 'artworks-000279620828-so10ak-t500x500-236336528447100.jpg', 3),
(32, 'Số Nghèo', 'Buồn cũng thế đã trót sinh ra con nhà nghèo\r\nĐành vậy thôi ngày hai buổi sớm hôm đi làm', 'Buồn cũng thế đã trót sinh ra con nhà nghèo\r\nĐành vậy thôi ngày hai buổi sớm hôm đi làm\r\nMình nghèo thế nên bạn cũng không tình yêu cũng muộn\r\nTay trắng nên âm thầm quạnh hiu.\r\nRồi trời cũng sẽ có lúc cho ta qua phận nghèo\r\nVì chẳng ai nghèo ba họ khó đau ba đời\r\nMột ngày biết đâu giàu có sao tự an ủi mình\r\nĐời phải đâu riêng mình cơm áo gạo tiền.\r\nCuộc đời thử hỏi có ai chẳng ai muốn mình sang giàu\r\nHỏi có ai muốn bấp bênh trong cảnh nghèo khó\r\nĐã trót sinh ra mang được tiếng được ngay con nhà nghèo\r\nĐành thế thôi học trèo cao chỉ thêm té đau.\r\nNghèo thì thử hỏi có ai muốn kết bạn tâm tình\r\nHỏi có ai thèm lắng nghe lời người nghèo khó\r\nMuốn nói yêu ai nhưng lại thôi bởi thân phận nghèo\r\nChỉ mong sao kiếp sau cho ta qua phận nghèo.', '2021-01-20 08:25:41', 47, 'c3d8996c4c5167812bc34ae662553111-236394963917100.jpg', 0),
(33, 'Hai Chuyến Tàu Đêm', 'Lòng buồn rạt rào\r\nNhớ hôm nào xuôi miền trung', 'Lòng buồn rạt rào\r\nNhớ hôm nào xuôi miền trung\r\nChuyến xe đêm anh gặp em\r\nMôi em đang xuân nhưng mắt buồn ngấn lệ trần\r\nChuyện đời sầu đắng vấn vương đôi má dịu hiền\r\nÁo em màu tím\r\nĐậm đà vì là buổi ban đầu ta gần nhau\r\nNói nhau nghe câu chuyện cũ\r\nTâm tư cho vơi bao nỗi buồn bước vào đời\r\nGiờ gặp lại nét thắm môi\r\nTiếng em hẹn hò tìm lại ngày mơ\r\nKhi chân đến quê em\r\nNắng ban mai hôn nhẹ lên khóm hoa tươi\r\nThoáng thấy em cười vì mùa thương vừa chắp nối\r\nVẫn biết phút bên nhau sẽ khơi buồn một ngày về\r\nVà cùng một tàu ấy anh về\r\nNhưng tìm đâu tiếng đêm qua cho lòng ấm\r\nĐêm nay cô đơn nghe gió lạnh rót vào hồn\r\nTàu về đường cũ tiếng hai đêm vẫn còn chờ\r\nGặp lại người xưa.', '2021-01-20 08:25:25', 47, 'maxresdefault-236378835120900.jpg', 1),
(34, 'Cô Hàng Xóm', 'Vùng ngoại ô, tôi có căn nhà tranh\r\nTuy bé nhưng thật xinh', 'Vùng ngoại ô, tôi có căn nhà tranh\r\nTuy bé nhưng thật xinh\r\nTháng ngày sống riêng một mình\r\nNhà ở bên, em sống trong giàu sang\r\nQuen gấm nhung đài trang\r\nĐi về xe đón đưa.\r\n\r\nĐêm đêm dưới ánh trăng vàng\r\nTôi với cây đàn âm thầm thở than\r\nVà cô nàng bên xóm\r\nMỗi lúc lên đèn, sang nhà làm quen.\r\n\r\n[ĐK:]\r\nTôi ca không hay tôi đàn nghe cũng dở\r\nNhưng nàng khen nhiều và thật nhiều\r\nLàm tôi thấy trong tâm tư xôn xao\r\nNhư lời âu yếm mặn nồng\r\nCủa đôi lứa yêu nhau.\r\n\r\nHai năm trôi qua, nhưng tình không dám ngỏ\r\nTôi sợ thân mình là bọt bèo\r\nLàm sao ước mơ duyên tơ mai sau\r\nTôi sợ ngang trái làm mộng đời\r\nChua xót thương đau.\r\n\r\nRồi một hôm tôi quyết đi thật xa\r\nTôi cố quên người ta\r\nNhững hình bóng trong xa mờ\r\nNhờ thời gian, phương thuốc hay thần tiên\r\nChia cách đôi tình duyên\r\nNên người xưa đã quên.\r\n\r\nHôm nay đón cánh thiệp hồng\r\nEm báo tin mừng lấy chồng giàu sang\r\nĐời em nhiều may mắn\r\nCó nhớ anh nhạc sĩ nghèo này không?', '2021-01-20 12:59:03', 48, 'c3d8996c4c5167812bc34ae662553111-252797110646400.jpg', 0),
(35, 'Đừng nói xa nhau', 'Đừng nói xa nhau cho tâm hồn đau khổ\r\nĐừng nói xa nhau cho mắt lệ hoen mờ', 'Đừng nói xa nhau cho tâm hồn đau khổ\r\nĐừng nói xa nhau cho mắt lệ hoen mờ\r\nLời thiết tha qua tâm tư tròn mộng tròn mơ\r\nVết tình khắc lên môi đưa mấy tuổi yêu vẫn chờ.\r\n\r\nMình đã đi chung trên con đường dang dở\r\nMình đã gieo neo nghe chóp bể mưa nguồn\r\nMàu áo xưa em đan cho người nặng hành trang\r\nCó bạc trắng với phong sương vẫn còn đậm tình thương.\r\n\r\n[ĐK:]\r\nĐời hay nói rằng yêu là chết ở trong lòng một ít\r\nVì mấy khi yêu mà chắc được, được người yêu\r\nCho, cho rất nhiều nhưng nhận chẳng có bao nhiêu\r\nNgười ta phụ hoặc thờ ơ chẳng biết.\r\n\r\nChỉ có đôi ta không bao giờ ly biệt\r\nChỉ có đôi ta tha thiết mộng ban đầu\r\nĐừng khóc cho tương lai mai thuyền ngược về đâu\r\nVới một tiếng tin yêu nhau, mối tình đẹp ngàn sau.', '2021-01-20 08:26:13', 47, 'hqdefault.jpg', 1),
(36, 'Mưa Rừng', 'Mưa rừng ơi mưa rừng,\r\nHạt mưa nhớ ai mưa triền miên', 'Mưa rừng ơi mưa rừng,\r\nHạt mưa nhớ ai mưa triền miên\r\nPhải chăng mưa buồn vì tình đời\r\nMưa sầu vì lòng người duyên kiếp không lâu.\r\nMưa từ đâu mưa về làm muôn lá hoa rơi tả tơi\r\nTiếng mưa gió lạnh lùa ngoài mành\r\nLá vàng rơi lìa cành gợi ta nỗi niềm riêng.\r\nÔi, ta mong ước xa xôi\r\nNhững đêm mãi cô đơn gửi tâm tư về đâu\r\nMưa thương ai, mưa nhớ ai\r\nMưa rơi như nhắc nhở, mưa rơi trong lòng tôi.\r\nMưa rừng ơi mưa rừng,\r\nTìm đâu hỡi ơi bóng người xưa\r\nMỗi khi mưa rừng về muộn màng\r\nBóng chiều vàng dần tàn\r\nLòng thương nhớ nào nguôi.', '2021-01-20 03:39:47', 47, '111956481_1601763659995989_823067657535618351_o.jpg', 0),
(37, 'Hai Lối Mộng', 'Xin giã biệt bạn lòng ơi\r\nTrao trả môi người cười', 'Xin giã biệt bạn lòng ơi\r\nTrao trả môi người cười\r\nVì hai lối mộng hai hướng trông\r\nMình thương nhau chưa trót\r\nThì chớ mang nỗi buồn theo bước đời\r\nCho dù chưa lần nói...\r\n\r\nNhưng nếu còn đẹp vì nhau\r\nXin nhẹ đi vào sầu\r\nGợi thương tiếc nhiều đau bấy nhiêu\r\nMình chia tay đi nhé\r\nĐể chốn nao với chiều mưa gió lộng\r\nTa dừng nơi bến mộng\r\n\r\nBao lần đi gối mỏi chân mòn\r\nTâm tư nặng vai gánh\r\nĐường trần cho đến nay\r\nChỉ còn.. bờ mi khép kín\r\nGiấc ngủ nào quên,\r\nGiấc ngủ nào gọi tên ....\r\n\r\nThôi nhắc nhở để mà chi\r\nQuay về xưa làm gì\r\nGiờ hai lối mộng hai hướng đi\r\nNiềm ưu tư tôi đếm\r\nTừng bước trên phố nhỏ đau gót mềm\r\nSao rụng giữa đường đêm ..', '2021-02-24 03:37:09', 47, 'hqdefault.jpg', 2),
(38, 'Bên Đời Hiu Quạnh', 'Một lần chợt nghe quê quán tôi xưa\r\nGiọng người gọi tôi nghe tiếng rất nhu mì.', 'Một lần chợt nghe quê quán tôi xưa\r\nGiọng người gọi tôi nghe tiếng rất nhu mì.\r\nLòng thật bình yên mà sao buồn thế\r\nGiật mình nhìn tôi ngồi hát bao giờ.\r\n...\r\nRồi một lần kia khăn gói đi xa\r\nTưởng rằng được quên thương nhớ nơi quê nhà.\r\nLòng thật bình yên mà sao buồn thế\r\nGiật mình nhìn tôi ngồi khóc bao giờ.\r\n...\r\nĐường nào quạnh hiu tôi đã đi qua\r\nĐường về tình tôi có nắng rất la đà.\r\nĐường thật lặng yên lòng không gì nhớ\r\nGiật mình nhìn quanh: Ồ phố xa lạ...\r\n...\r\nĐường nào dìu tôi đi đến cơn say\r\nMột lần nằm mơ tôi thấy tôi qua đời.\r\nDù thật lệ rơi lòng không buồn mấy\r\nGiật mình tỉnh ra: Ồ nắng lên rồi..', '2021-02-24 03:37:27', 46, '111956481_1601763659995989_823067657535618351_o.jpg', 1),
(39, 'Ca Dao Mẹ', 'Mẹ ngồi ru con đong đưa võng buồn đong đưa võng buồn\r\nMẹ ngồi ru con mây qua đầu ghềnh lạy trời mưa tuôn', 'Mẹ ngồi ru con đong đưa võng buồn đong đưa võng buồn\r\nMẹ ngồi ru con mây qua đầu ghềnh lạy trời mưa tuôn\r\nLạy trời mưa tuôn cho đất sợi mềm hạt mầm vun lên\r\nMẹ ngồi ru con nước mắt nhọc nhằn xót xa đời mình.\r\n\r\nMẹ ngồi ru con đong đưa võng buồn năm qua tuổi mòn\r\nMẹ nhìn quê hương nghe con mình buồn giọt lệ ăn năn\r\nGiọt lệ ăn năn đưa con về trần tủi nhục chung thân\r\nMột dòng sông trôi cuốn mãi về trời bấp bênh phận người.\r\n\r\n[ĐK:]\r\nMẹ ngồi ru con tiếng hát lênh đênh\r\nMẹ ngồi ru con ru mây vào hồn\r\nMẹ dạy cho con tiếng nói quê hương\r\nMẹ nhìn con đi phút giây bàng hoàng.\r\n\r\nMẹ ngồi ru con đong đưa võng buồn đong đưa phận mình\r\nMẹ ngồi ru con nghe đất gọi thầm trọn nợ lưu vong\r\nMẹ ngồi trăm năm như thân tượng buồn để lại quê hương\r\nTuổi còn bơ vơ thế giới hằn thù chiến tranh ngục tù.', '2021-01-20 12:58:47', 48, 'artworks-000279620828-so10ak-t500x500-252781217200500.jpg', 0),
(40, 'Dân Chơi Xóm', 'Quần đùi gang đi vào club\r\nXếp hàng vào đi, không phải tranh nhau', 'Quần đùi gang đi vào club\r\nXếp hàng vào đi, không phải tranh nhau\r\nEm nào anh thích thì anh sẽ gọi là baby\r\nHaters nhiều cứ như là anh Bâu\r\nEm không chơi với cả truyền nhân của JTee\r\nAnh skrt lân, trên tay anh là một chai Bali\r\nEm biết không, nếu mà khách quan\r\nThì độ đẹp trai của anh được 2 vali\r\n\r\n[Justatee]\r\nGiọng ca vàng trong xóm đi vào\r\nDạt sang một bên hết đi nào\r\nLan Quế Phường tầm này là tầm thường\r\nỞ đấy mới là thiên đường\r\nChân đi dép đeo khuyên tai\r\nVuốt keo 502\r\nBước đi trong the club nhìn ai cũng biết anh là ai\r\nCao 1m52, fresh như Xuân Mai\r\nBước đi trong the club\r\nJuss Juss on the mic\r\nMấy đứa (3x)\r\nMấy đứa nhìn vào mình và\r\nMấy đứa (3x)\r\nMấy đứa thì thầm thập thờ\r\nMấy đứa (3x)\r\nMấy đứa dập nhạc xập xình\r\nMấy đứa (3x)\r\nMấy đứa đừng làm trò\r\n\r\n[MCK]\r\nShow love cho anh Binz ngồi trên con Lamborghini\r\nChân mang dép, đi vào bar, bởi vì làm thế nó mới chất\r\nKhông nghe máy đâu thôi đừng call bởi vì bọn anh đang đi thi\r\nBọn anh nhà quê làm vì nghệ thuật và cả VND\r\nKhông phải bất cần như ông Phúc xích lô\r\nĐốt club kiểu ung dung mặt bọn anh vẫn ngầu\r\nSau ba vòng thi thì người anh như xúc xích khô\r\nĐổi lại là nói chung chung thì đội anh đang dẫn đầu\r\nRap Việt hôm nay như club đấy là tin thật\r\nBọn anh vuốt tóc như mấy thanh niên trong phim Nhật\r\nChạy đến chỗ bố Tou order một con beat tim cật\r\nCó mấy chú chó ở trên ô tô đang xỉn gật\r\nThế nên là vỗ tay luôn không thì nhà em sáng nhất đêm nay\r\nEm đưa theo crush nhưng mà lại sơ anh tán mất\r\nAnh trông hơi lúa nhưng mà nhà anh vừa bán đất\r\nBọn anh hơi bị phóng khoáng nhưng khoảng ở đây là khoáng chất\r\nYeah yeah\r\n\r\n[Justatee]\r\nGiọng ca vàng trong xóm đi vào\r\nDạt sang một bên hết đi nào\r\nLan Quế Phường tầm này là tầm thường\r\nỞ đấy mới là thiên đường\r\nChân đi dép đeo khuyên tai\r\nVuốt keo 502\r\nBước đi trong the club nhìn ai cũng biết anh là ai\r\nCao 1m52, fresh như Xuân Mai\r\nBước đi trong the club\r\nJuss Juss on the mic\r\nMấy đứa (3x)\r\nMấy đứa nhìn vào mình và\r\nMấy đứa (3x)\r\nMấy đứa thì thầm thập thò\r\nMấy đứa (3x)\r\nMấy đứa dập nhạc xập xình\r\nMấy đứa (3x)\r\nMấy đứa đừng làm trò\r\nChân đi dép đeo khuyên tai\r\nVuốt keo 502\r\nBước đi trong the club nhìn ai cũng biết anh là ai\r\nCao 1m52, fresh như Xuân Mai\r\nBước đi trong the club\r\nJuss Juss on the mic\r\nMấy đứa (3x)\r\nMấy đứa nhìn vào mình và\r\nMấy đứa (3x)\r\nMấy đứa thì thầm thập thò\r\nMấy đứa (3x)\r\nMấy đứa dập nhạc xập xình\r\nMấy đứa (3x)\r\nMấy đứa đừng làm trò', '2021-01-20 13:09:16', 3, '111956481_1601763659995989_823067657535618351_o.jpg', 2),
(41, 'Bài Này Chill Phết', 'I just wanna chill with you tonight\r\nAnd all the sorrow left behind uh oh\r\nSometimes I feel lost in the crowd', 'I just wanna chill with you tonight\r\nAnd all the sorrow left behind uh oh\r\nSometimes I feel lost in the crowd\r\nLife is full of ups and downs\r\nBut it’s alright, I feel peaceful inside\r\n\r\nVerse1:\r\nEm dạo này ổn không? Còn đi làm ở công ty cũ\r\nCòn đi sớm về hôm mà đồng lương vẫn không khi đủ\r\nĐồng nghiệp của Em thế nào? Trong thang máy có chào với nhau\r\nCó nói qua nói lại, và những cuộc họp có đào bới nhau\r\nSếp của Em thế nào, dễ tính hay thường gắt gỏng\r\nAnh ta có thương nhân viên hay thường buông lời sắc mỏng\r\nEm còn thiếu ngủ, trong những lần phải chạy deadline\r\nEm quên ăn quên uống, quên cả việc chải lại tóc tai\r\nNhững đôi giày cao gót chắc còn làm đau Em\r\nTiền bao nhiêu cho đủ, ai biết ngày sau Em?\r\nMắt Em còn mỏi không 8 tiếng nhìn màn hình\r\nNhững tối đi về đơn độc Em thấy lòng mình lặng thinh\r\nVà đừng để đời chỉ là những chuỗi ngày được chấm công\r\nMiệng cười như nắng hạ, nhưng trong lòng thì chớm đông\r\nNếu mà mệt quá, giữa thành phố sống chồng lên nhau\r\nCùng lắm thì mình về quê, mình nuôi cá và trồng thêm rau\r\n\r\nMelody:\r\nTrời thả vạt nắng khiến đám tóc Em hoe vàng\r\nChiều nay đi giữa thành phố Em bỗng thấy sao mơ màng\r\nTìm cho mình một không gian, bật bài nhạc làm Em chill\r\nTâm hồn Em, phiêu dạt theo áng mây bên trời\r\n\r\nVerse 2:\r\nAnh dạo này cũng bận nhiều, và cũng có thêm nhiều đêm diễn\r\nÂm nhạc mở lối cuộc đời Anh, như là ngọn hải đăng ở trên biển\r\nAnh được gặp những người nổi tiếng, trước giờ chỉ thấy trên tivi\r\nGặp H\'Hen Niê hoa hậu, gặp cả Sơn Tùng M-TP\r\nĐi hát vui lắm em, vì đồng âm của Anh họ rất tuyệt\r\nBọn Anh hát cùng nhau, khiến cho thanh xuân này như bất diệt\r\nAnh thấy mình không cô đơn, không áp lực nào buộc chân Anh\r\nNhiều khi Anh lên sân khấu mà dưới khán giả họ thuộc hơn Anh\r\nAnh cũng có những hợp đồng, những điều khoản mà Anh phải dần quen\r\nAnh cũng cần tiền, những dự án họ nói họ cần Đen\r\nVà những con số, nặng tới mức đủ sức làm choáng mình\r\nNhưng em yên tâm, Anh bán chất xám chứ chưa từng bán mình\r\nNhưng cũng có lúc mọi thứ không như là những gì ta muốn\r\nThế giới này vận hành theo cái cách luôn ghì ta xuống\r\nNhưng mà mộng mơ Anh nhiều như niêu cơm của Thạch Sanh\r\nAi muốn lấy cứ lấy, không thể nào mà sạch banh\r\n\r\nVerse 3:\r\nMình sướng hơn những người giàu nhỉ\r\nVầng trán mình chưa hề nhàu nhĩ\r\nDù chênh vênh như là cầu khỉ\r\nĐời sóng gió mình là tàu thuỷ\r\nVì một ngày còn sống, là một ngày đắm say\r\nNgày đẹp trời nhất, là ngày mình còn nắm tay\r\nMình sẽ không ngã, vì mình ngã họ hả hê\r\nBiển người cũng là biển, cho tụi mình tắm thoả thuê\r\nChúng ta sẽ không, là một ai trông giống họ\r\nSẽ không rỗng tuếch, như một cái chai trong đống lọ\r\nSáng chúng ta làm, vì tờ bạc nhiều màu trong ví\r\nĐêm về ta chill, riêng mình một bầu không khí\r\nVì tim ta còn trẻ, dù thân xác ta sẽ già\r\nNhưng mà ta không ủ rũ, như là mấy con sẻ già\r\nChúng ta có những chiều vàng, dắt tay nhau lên đồi xa\r\nNắng khoác lên mình lớp áo, nheo mắt lại nhìn trời hoa\r\nVà những đêm đen huyền dịu, cho tiếng lòng thêm dõng dạc\r\nTa thấy nhau bằng tâm hồn, không cần nhìn bằng võng mạc\r\nTa sẽ cố để có được những thứ mà ta chờ mong\r\nDưới ngọn đồi, căn nhà nhỏ, nhìn ra bờ sông\r\nVì anh chưa từng mơ ngày nào đó mình trở thành siêu sao\r\nTừ ngày thơ bé anh đã muốn trở thành chưởng môn phái Tiêu Dao\r\n\r\nEm ơi vui cười lên vì đời này ai không âu lo\r\nThôi băn khoăn ngày mai mệt nhoài hệt như con sâu đo\r\nEm đi ra ngoài kia tìm về vài chai Strongbow oh\r\nĐêm nay em cần chill, việc này để cho Đen Vâu lo !', '2021-01-20 08:33:08', 3, '111956481_1601763659995989_823067657535618351_o.jpg', 1),
(42, 'Va Vào Giai Điệu Này', 'Oh baby girl yah yah\r\nGimme your love, đó là phần quà', 'Oh baby girl yah yah\r\nGimme your love, đó là phần quà\r\nLàm anh chìm sâu trước khi anh nhận ra rằng là “no” !\r\nCháu của anh sẽ gọi em bằng bà\r\n\r\nBởi vì anh muốn nắm tay nhau\r\nVà va vào giai điệu này\r\nĐể bản thân này 1 ngày chẳng còn thấy giọt buồn chậm lăn ở 2 mi ooh ooh, yeah\r\nNắm tay nhau và va vào giai điệu này\r\n\r\nĐể 1 ngày em hiểu được là there ain’t nobody like me oh no, yeah\r\nTay đan trong tay ta chung đôi đi vào club\r\nBaby tin anh ta không xếp ở hàng chờ\r\nAnh khoe baby anh như Playboi Camau\r\n\r\nBaby nháy mắt, quay đi, làm NGER\r\nVậy tình là gì làm mình viết ra ther\r\nAnh đã quá *** với kiếp đợi chờ\r\nTa đang hôn nhau trong club đèn merrr yeah yeah yeah\r\n\r\nFunny man, with a funny girl\r\nSiêu sao, and lovebirds\r\nEm là Chanel, Versache, Bape\r\nGặp drama, em skrtskrt\r\n\r\nNhiệt độ tăng nhanh khiến anh chóng mặt\r\nEm làm thời gian như đóng băng\r\nBởi vì anh biết trong tim em là ice ice ice ice\r\nOoh\r\n\r\nDCOD life yeah\r\nChân em mang Nike low ooh\r\nYou gotta pick a side yeah\r\nEenie miney moe\r\n\r\nMình cùng ngồi ngắm trăng tàn\r\nỞ Sài Gòn hai giờ đêm\r\nHenni làm mắt ai mờ thêm\r\nYeah sau đêm nay xem là ai ở bên\r\n\r\nCùng nắm tay nhau và va vào giai điệu này\r\nĐể bản thân này 1 ngày chẳng còn thấy giọt buồn chậm lăn ở 2 mi ooh ooh, yeah\r\nNắm tay nhau và va vào giai điệu này\r\nĐể 1 ngày em hiểu được là there ain’t nobody like me oh no, yeah\r\n\r\nOoh la la la la\r\nOoh la la la la\r\nWake up ở cầu Sài Gòn\r\nVới những mẩu chuyện dài thòng\r\n\r\nJust let me ease ur mind\r\nOoh la la la la\r\nEm chính là điều thần kì\r\nGhé đến và rồi thầm thì\r\n\r\nCần gì khi đã có nhau\r\nOoh la la la la\r\nThanh âm bên tai đôi khi ngây ngất như mùi hương trên vai\r\nVà đam mê của anh là hái ra tiền\r\n\r\nĐặt một nụ cười lên môi em đêm mai\r\nYeah, anh không hay ghen\r\nVà niềm vui của anh là được hôn tay em\r\nVà ngay sau đêm nay là anh đã muốn\r\n\r\nAnh đã muốn\r\nYeah\r\nDCOD life yeah\r\nChân em mang Nike low ooh\r\n\r\nYou gotta pick a side yeah\r\nEenie miney moe\r\nMình cùng ngồi ngắm trăng tàn\r\nỞ Sài Gòn hai giờ đêm\r\n\r\nHenni làm mắt ai mờ thêm\r\nYeah sau đêm nay xem là ai ở bên\r\nCùng nắm tay nhau và va vào giai điệu này\r\n\r\nĐể bản thân này 1 ngày chẳng còn thấy giọt buồn chậm lăn ở 2 mi ooh ooh, yeah\r\nNắm tay nhau và va vào giai điệu này\r\nĐể 1 ngày em hiểu được là there ain’t nobody like me oh no, yeah', '2021-01-20 08:33:03', 3, '111956481_1601763659995989_823067657535618351_o.jpg', 1),
(54, 'Anh thật sự ngu ngốc', 'Không thể tin vào giây phút ấy\r\nKhông ngờ đến ngày ta chia tay\r\nXin lỗi anh không giữ lời hứa', 'Không thể tin vào giây phút ấy\r\nKhông ngờ đến ngày ta chia tay\r\nXin lỗi anh không giữ lời hứa\r\nKhông một ai được phép\r\nTổn thương lên người con gái ấy\r\nNhưng dù sao điều anh muốn biết\r\nKhoảng cách nào mà ta tạo ra dấu chấm hết?\r\nPhải nhận đau một lần mới thấu\r\nNếu đã là của nhau không giữ chặt tay sẽ vụt mất về sau\r\nAnh thật sự ngu ngốc\r\nBảo vệ người ấy cũng không xong\r\nNỡ làm người yêu khóc\r\nThế thì còn xứng đáng yêu không?\r\nAnh biết rằng anh sai\r\nNhưng không bao giờ tha thứ\r\nNgười nào tổn thương đến trái tim em như anh đã từng như thế\r\nAnh thật lòng xin lỗi\r\nNhưng chẳng thể níu kéo nên thôi\r\nVẫn là vì anh sai\r\nVẫn là anh cố chấp ngày dài\r\nÐiều sau cuối anh làm\r\nNụ cười em đem hết đi\r\nCứ gói nỗi buồn lại để anh mang\r\nBao lần ta bỏ qua cho nhau\r\nNhưng nỗi lòng cả hai tạo ra nhiều vết xước\r\nHình như sau mọi lần cãi vã\r\nAnh dần dần nhận ra ta không còn...\r\nThân nhau yêu nhau như lúc ngày xưa\r\nAnh thật sự ngu ngốc\r\nBảo vệ người ấy cũng không xong\r\nNỡ làm người yêu khóc\r\nThế thì còn xứng đáng yêu không?\r\nAnh biết rằng anh sai\r\nNhưng không bao giờ tha thứ\r\nNgười nào tổn thương đến trái tim em như anh đã từng như thế\r\nAnh thật lòng xin lỗi\r\nNhưng chẳng thể níu kéo nên thôi\r\nVẫn là vì anh sai\r\nVẫn là anh cố chấp ngày dài\r\nÐiều sau cuối anh làm\r\nNụ cười em đem hết đi\r\nCứ gói nỗi buồn lại để anh mang\r\nĐành để em cứ đi như vậy\r\nNếu em không còn yêu anh nữa\r\nMỏi mệt vì tình yêu đến vậy\r\nChia tay để tìm người tốt hơn (em sẽ quay trở về)\r\nGiật mình anh mới biết anh quá vô tâm\r\nĐến ngay cả một người cũng đánh mất\r\nAnh thật sự ngu ngốc\r\nBảo vệ người ấy cũng không xong\r\nNỡ làm người yêu khóc\r\nThế thì còn xứng đáng yêu không?\r\nAnh biết rằng anh sai\r\nNhưng không bao giờ tha thứ\r\nNgười làm tổn thương đến trái tim em như anh đã từng như thế\r\nAnh thật lòng xin lỗi\r\nNhưng chẳng thể níu kéo nên thôi\r\nVẫn là vì anh sai\r\nNhưng vẫn là anh cố chấp ngày dài\r\nÐiều sau cuối anh làm\r\nNụ cười em đem hết đi\r\nCứ gói nỗi buồn lại để anh mang\r\nÐiều sau cuối anh làm\r\nNiềm vui em hãy đem theo\r\nCứ gói nỗi buồn lại để anh mang', '2021-01-22 15:24:15', 48, 'c3d8996c4c5167812bc34ae662553111-253793429427600.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`) VALUES
(15, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'Võ Văn Tưởng'),
(16, 'yenvu', 'e10adc3949ba59abbe56e057f20f883e', 'Võ Yên'),
(18, 'IsPhin', 'e10adc3949ba59abbe56e057f20f883e', 'Võ Văn Phin'),
(20, 'mod', '40b873f167b467fadb4fe865660e352d', 'sa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
