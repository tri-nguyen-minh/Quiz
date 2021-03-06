USE [master]

GO
ALTER DATABASE [QuizWebManagement] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizWebManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizWebManagement] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QuizWebManagement] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QuizWebManagement] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QuizWebManagement] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QuizWebManagement] SET ARITHABORT OFF
GO
ALTER DATABASE [QuizWebManagement] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [QuizWebManagement] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QuizWebManagement] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QuizWebManagement] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QuizWebManagement] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QuizWebManagement] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QuizWebManagement] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QuizWebManagement] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QuizWebManagement] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QuizWebManagement] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QuizWebManagement] SET  DISABLE_BROKER
GO
ALTER DATABASE [QuizWebManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QuizWebManagement] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QuizWebManagement] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QuizWebManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QuizWebManagement] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QuizWebManagement] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QuizWebManagement] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QuizWebManagement] SET  READ_WRITE
GO
ALTER DATABASE [QuizWebManagement] SET RECOVERY SIMPLE
GO
ALTER DATABASE [QuizWebManagement] SET  MULTI_USER
GO
ALTER DATABASE [QuizWebManagement] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QuizWebManagement] SET DB_CHAINING OFF
GO
USE [QuizWebManagement]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 08/14/2020 01:20:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectId] [varchar](50) NOT NULL,
	[subject_name] [varchar](50) NOT NULL,
	[question_count] [int] NOT NULL,
	[quiz_time] [int] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Subject] ([subjectId], [subject_name], [question_count], [quiz_time]) VALUES (N'AWH', N'Ancient History - Fun And Violent', 30, 40)
INSERT [dbo].[Subject] ([subjectId], [subject_name], [question_count], [quiz_time]) VALUES (N'ENG', N'English', 30, 20)
INSERT [dbo].[Subject] ([subjectId], [subject_name], [question_count], [quiz_time]) VALUES (N'PRJ311', N'Java Desktop', 50, 60)
/****** Object:  Table [dbo].[Status]    Script Date: 08/14/2020 01:20:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[statusId] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Status] ([statusId], [status]) VALUES (1, N'New')
INSERT [dbo].[Status] ([statusId], [status]) VALUES (2, N'Active')
INSERT [dbo].[Status] ([statusId], [status]) VALUES (3, N'DeActive')
/****** Object:  Table [dbo].[QuestionBank]    Script Date: 08/14/2020 01:20:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionBank](
	[id] [varchar](50) NOT NULL,
	[question_content] [varchar](max) NOT NULL,
	[correct_answer] [varchar](max) NOT NULL,
	[answer_one] [varchar](max) NOT NULL,
	[answer_two] [varchar](max) NOT NULL,
	[answer_three] [varchar](max) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[subjectId] [varchar](50) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_QuestionBank] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH1', N'Who was the author of the two Ancient Greek''s epic poems Illiad and Odyssey?', N'Homer.', N'Plato.', N'Pliny the Younger.', N'Sappho.', CAST(0x0000ABCE0106F8D3 AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH10', N'Where is the birthplace of Alexander the Great?', N'Macedonia.', N'Rome.', N'Athens.', N'Crete.', CAST(0x0000ABCE0106F8DC AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH11', N'Which is NOT a known fact about Alexander the Great?', N'He was assassinated by some of his closest aids.', N'He had never lost a battle.', N'He renamed most of the cities he''d captured after himself.', N'He was linked to the legend of the Gordian Knot.', CAST(0x0000ABCE0106F8DC AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH12', N'What were the two main city states of Ancient Greece?', N'Sparta and Athens', N'Roma and Alexandria', N'Corinth and Olympia', N'Thebes and Argos', CAST(0x0000ABCE0106F8DC AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH13', N'Which was not a major city of Ancient Greece?', N'Rome', N'Argos', N'Athens', N'Thebes', CAST(0x0000ABCE0106F8DD AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH14', N'What is the main focus of the epic poem Odyssey?', N'Odysseus''s 10-year journey home from Troy.', N'Odysseus during of the Trojan War.', N'The conflict between Agamemnon and Achilles.', N'Odysseus and the Trojan Horse.', CAST(0x0000ABCE0106F8DD AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH15', N'Who led the Greek forces in the Battle of Thermopylae against the Persian''s army?', N'King Leonidas of Sparta.', N'King Agamemnon of Mycenae.', N'King Menelaus of Sparta.', N'King Oedipus of Thebes.', CAST(0x0000ABCE0106F8DD AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH16', N'Which is NOT one of the legendary Heracles''s twelve labors?', N'Slay the Medusa.', N'Slay the Learnean Hydra.', N'Capture the three-head Cerberus.', N'Obtain the Golden Apple.', CAST(0x0000ABCE0106F8DE AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH17', N'Which Greek city is often called the "birthplace of democracy"?', N'Athens', N'Delphi', N'Corinth', N'Sparta', CAST(0x0000ABCE0106F8DE AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH18', N'Which river did the Egyptian civilization spring from?', N'The Nile River.', N'The Amazon River.', N'The Thames.', N'The Yellow River.', CAST(0x0000ABCE0106F8DE AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH19', N'Who was considered the Father of Medicine?', N'Hippocrates', N'Herodotus', N'Homer', N'Thucydides', CAST(0x0000ABCE0106F8DE AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH2', N'What event was widely considered the inspiration for the story of Atlantis?', N'The Minoan Eruption around 1600 - 1700 BC.', N'The Eruption of Mount Vesuvius in 79 AD.', N'The Rhodes earthquake of 226 BC.', N'The Sparta earthquake of 464 PC.', CAST(0x0000ABCE0106F8DA AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH20', N'Who was considered the Father of History?', N'Herodotus', N'Hippocrates', N'Homer', N'Thucydides', CAST(0x0000ABCE0106F8DF AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH21', N'Which is the oldest civilization in the world?', N'The Egyptian Civilization', N'The Greek Civilization', N'The Chinese Civilization', N'The Aztec Civilization', CAST(0x0000ABCE0106F8DF AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH22', N'Which Wonder of the Ancient World was burned down by an arsonist who sought fame?', N'Temple of Artemis.', N'The Hanging Grden of Babylon.', N'The Lighthouse of Alexandria.', N'The Mausoleum at Halicarnassus.', CAST(0x0000ABCE0106F8DF AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH23', N'Which form of torture and execution involved placing the accused inside a bronze bull, which is put over a fire?', N'The Brazen Bull.', N'Judas Cradle.', N'The Bull of Hell.', N'Scaphism.', CAST(0x0000ABCE0106F8DF AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH24', N'Who was the Greek poetess, from whom the word "lesbian" was derived?', N'Sappho.', N'Lesbet.', N'Anthousa.', N'Lilith.', CAST(0x0000ABCE0106F8DF AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH25', N'During the mummification process, how did Ancient Egyptians remove the brain from the body?', N'They used a hook and pull the brain out through the nose.', N'They don''t remove the brain.', N'They cracked the skull open to remove the brain.', N'They remove the brain through the eye holes.', CAST(0x0000ABCE0106F8E0 AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH26', N'Which is true about Cleopatra, the last Queen of Egypt?', N'ALl of the others.', N'She was Greek.', N'She was the only ruler of her Kingdom to learn the Egyptian Language.', N'She committed suicide to avoid being captured.', CAST(0x0000ABCE0106F8E0 AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH27', N'Which of the Seven Wonders of the Ancient World has never been proven to ever exist?', N'The Hanging Garden of Babylon.', N'The Collosus of Rhodes.', N'The Mausoleum at Halicarnassus.', N'The Great Statue of Zeus on Cephalonia.', CAST(0x0000ABCE0106F8E0 AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH3', N'Which empire is the largest empire in history?', N'The British Empire.', N'The Roman Empire.', N'The Mongol Empire.', N'The Byzantine Empire.', CAST(0x0000ABCE0106F8DA AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH4', N'Which Roman Emperor was once held ransom for a 12,000 gold-piece, for which he himself considered as too low?', N'Julius Ceasar', N'Ceasar Augustus', N'Caligula', N'Nero', CAST(0x0000ABCE0106F8DA AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH5', N'Which island was considered the origin of Ancient Greek civilization?', N'Crete.', N'Samos.', N'Lesbos.', N'Rhodes.', CAST(0x0000ABCE0106F8DA AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH6', N'Which is the only surviving construction of the Seven Wonders of the Ancient World?', N'The Pyramids of Giza.', N'The Great Wall of China.', N'The Temple of Artemis.', N'The Mausoleum at Halicarnassus.', CAST(0x0000ABCE0106F8DB AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH7', N'Which is one of the Seven Wonders of the Ancient World?', N'The Statue of Zeus at Olympia.', N'The Great Statue of Zeus on Cephalonia.', N'The Bronze Statue of Athena on the Acropolis of Athens.', N'The Great Wall of China.', CAST(0x0000ABCE0106F8DB AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH8', N'The Peloponnesian War was an ancient war that lasted 27 years between?', N'Athens and Sparta.', N'Greece and Egypt.', N'Persia and Greece.', N'Athens and Macedon.', CAST(0x0000ABCE0106F8DB AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'AWH9', N'Who was the last ruler of ancient Egypt?', N'Cleopatra.', N'Nefertiti.', N'Tutankhamun.', N'Imhotep.', CAST(0x0000ABCE0106F8DC AS DateTime), N'AWH', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG1', N'______? -There are one thousand.', N'How many grams are there in a kilogram?', N'How many are there grams in a kilogram?', N'How many grams are they in a kilogram?', N'How many grams are there of a kilogram?', CAST(0x0000ABC10179537F AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG10', N'How long ______ in Spain on vacation last summer?', N'were they', N'you are been', N'are been', N'was', CAST(0x0000ABC101795386 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG11', N'Next weekend, we hope to ______ for a few days.', N'get away', N'get on', N'get through', N'get of', CAST(0x0000ABC101795386 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG12', N'They''re tired ______ they worked for ten hours.', N'because', N'however', N'or', N'when', CAST(0x0000ABC101795387 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG13', N'______ they the first customers of the day?', N'Were', N'Who', N'Was', N'Who were', CAST(0x0000ABC101795387 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG14', N'I must go home because my husband ______ for me.', N'is waiting', N'are waiting', N'am waiting', N'waits', CAST(0x0000ABC101795387 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG15', N'You can''t have your cake ______ eat it too.', N'and', N'although', N'while', N'or', CAST(0x0000ABC101795387 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG16', N'Who is your daughter''s brother? -______', N'He is my son.', N'He is married to her.', N'He is her husband''s brother.', N'She is his sister.', CAST(0x0000ABC101795388 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG17', N'Had they ______ arrived when you got there?', N'already', N'after', N'before', N'still', CAST(0x0000ABC101795388 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG18', N'Elizabeth''s been working there ______ only eight months.', N'for', N'in', N'by', N'since', CAST(0x0000ABC101795388 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG19', N'Who is she talking to on the phone? -______', N'She''s talking to her sister.', N'She talks to Lorenzo Rodriguez', N'Him she is talking to.', N'She''s not talking to me sister.', CAST(0x0000ABC101795388 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG2', N'Is there a doctor in the house? -______', N'Yes, there is.', N'Yes, is there.', N'No, isn''t.', N'No, they isn''t.', CAST(0x0000ABC101795385 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG20', N'Thomas can''t get out of bed because he ______ his leg.', N'broke', N'broken', N'break', N'breaks', CAST(0x0000ABC101795388 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG21', N'Are these cats bigger than those dogs? -______', N'Yes, they are bigger!', N'Yes, are.', N'No, those dogs are the bigger.', N'No, dogs are the biggest.', CAST(0x0000ABC101795388 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG22', N'______? -She was at school.', N'Where was Suzanne during the earthquake?', N'Was Suzanne yesterday at home?', N'Suzanne where was yesterday?', N'Where is Veronica''s sister?', CAST(0x0000ABC101795388 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG23', N'we are so late because our car ______ down on the highway.', N'broke', N'breaks', N'broken', N'break', CAST(0x0000ABC101795389 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG24', N'I have never ______ such a boring book!', N'read', N'saw', N'readed', N'red', CAST(0x0000ABC101795389 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG25', N'Who is your mother''s sister''s daughter? -______', N'She is my cousin.', N'She is my wife.', N'She is my mother''s nephew.', N'Is my mother''s niece.', CAST(0x0000ABC101795389 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG26', N'She ______ blue velvet to the party last night.', N'wore', N'worn', N'weared', N'wear', CAST(0x0000ABC101795389 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG27', N'The little dog ______ my leg.', N'bit', N'bited', N'bite', N'bitten', CAST(0x0000ABC10179538A AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG28', N'You two are always fighting. Why can''t you ______?', N'get along', N'get over', N'get off', N'get down', CAST(0x0000ABC10179538A AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG29', N'We must ______ the train at the next stop.', N'get off', N'get over', N'get on', N'get down', CAST(0x0000ABC10179538A AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG3', N'What hours ______? -From nine to five, Monday through Friday.', N'do you normally work', N'work you normally', N'are you normally working', N'you work normally', CAST(0x0000ABC101795385 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG30', N'Which river is bigger: the Amazon or the Nile? -______', N'The Amazon''s bigger than the Nile.', N'The Amazon is the bigger.', N'Bigger the Amazon is.', N'The Amazon is bigger the Nile.', CAST(0x0000ABC10179538A AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG31', N'The milk is ______ the refrigerator.', N'in', N'from', N'of', N'at', CAST(0x0000ABC10179538A AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG32', N'______ is your house? -It''s the small grey one.', N'Which', N'When', N'What', N'Where', CAST(0x0000ABC10179538B AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG33', N'How tall is that building? -______', N'It''s about 95 stories.', N'Is 378 meters tall.', N'That building is much tall than this one.', N'It is tall 300 meters.', CAST(0x0000ABC10179538B AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG34', N'The train goes ______ many tunnels on the way to Rome.', N'through', N'in', N'past', N'over', CAST(0x0000ABC10179538B AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG35', N'Whose keys are these? -______ are mine.', N'They', N'These', N'It', N'Keys', CAST(0x0000ABC10179538B AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG36', N'We''ve just come ______ the beach and we are thirsty.', N'from', N'for', N'back', N'of', CAST(0x0000ABC10179538B AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG37', N'I can speak English, but I ______ French.', N'can''t speak', N'speak', N'speak not', N'no speak', CAST(0x0000ABC10179538B AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG38', N'What is she doing? -______', N'She''s waiting for you.', N'She cooking dinner.', N'She are watching TV.', N'She''d talking to Mary on the phone.', CAST(0x0000ABC10179538B AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG39', N'Where should Suzanne ______?', N'sit', N'find', N'put', N'repair', CAST(0x0000ABC10179538C AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG4', N'My hair is longer than ______.', N'hers', N'your', N'your''s', N'she''s', CAST(0x0000ABC101795385 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG40', N'Never look directly ______ the sun. It is bad for your eyes.', N'at', N'to', N'for', N'through', CAST(0x0000ABC10179538C AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG41', N'She ______ dinner with Junko when you called last night.', N'was having', N'am having', N'have', N'had had', CAST(0x0000ABC10179538C AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG42', N'______ tired from working so much?', N'Are you', N'She''s', N'Is', N'You are', CAST(0x0000ABC10179538C AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG43', N'Right now, my mother ______ dinner in the kitchen.', N'is cooking', N'cooks', N'does cook', N'cooking', CAST(0x0000ABC10179538C AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG44', N'I''m surprised because rain was not ______ in the weather report.', N'predicted', N'prediction', N'predictable', N'predictably', CAST(0x0000ABC10179538D AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG45', N'I told you ______ you didn''t listen.', N'but', N'because', N'for', N'then', CAST(0x0000ABC10179538D AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG46', N'English grammar ______ than German grammar.', N'is worse.', N'is worst.', N'worst.', N'is badder.', CAST(0x0000ABC10179538D AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG47', N'I''m busy, so you will just have to ______.', N'wait', N'avoid', N'like', N'attempt', CAST(0x0000ABC10179538D AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG48', N'______ are you mad? -Because you are late!', N'Why', N'When', N'Where', N'What', CAST(0x0000ABC10179538D AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG49', N'These pants ______ mine; that jacket is yours.', N'are', N'is', N'are wearing', N'is wearing', CAST(0x0000ABC10179538E AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG5', N'He was invited ______ he did not come.', N'but', N'if', N'when', N'or', CAST(0x0000ABC101795385 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG50', N'We get good grades ______ we study.', N'because', N'but', N'except', N'or', CAST(0x0000ABC10179538E AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG51', N'I''m sleepy because I ______ at six o''clock this morning.', N'got up', N'got by', N'got down', N'got along', CAST(0x0000ABC10179538E AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG52', N'Edward has always ______ things very quickly and efficiently.', N'done', N'does', N'doed', N'did', CAST(0x0000ABC10179538E AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG53', N'I''ve ______ a terrible headache.', N'got', N'have', N'gets', N'gottin', CAST(0x0000ABC10179538E AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG54', N'What ______? -This is my new ring.', N'is that', N'is', N'are these', N'those', CAST(0x0000ABC10179538E AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG55', N'I will speak ______ Suzanne when I see her.', N'to', N'in', N'around', N'at', CAST(0x0000ABC10179538E AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG56', N'______ my wife sleeps, I watch TV late at night.', N'While', N'Through', N'During', N'From', CAST(0x0000ABC10179538F AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG57', N'He ______ all of them.', N'wanted', N'went', N'listened', N'spoke', CAST(0x0000ABC10179538F AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG58', N'She cannot talk ______ walk at the same time.', N'and', N'because', N'while', N'but', CAST(0x0000ABC10179538F AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG59', N'What ______ your favorite foods as a child?', N'were', N'will', N'would', N'was', CAST(0x0000ABC10179538F AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG6', N'Where are my car keys? -They are ______ your hand!', N'in', N'on', N'to', N'of', CAST(0x0000ABC101795385 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG60', N'Monica is tired. She doesn''t want to go ______ school.', N'to', N'at', N'for', N'in', CAST(0x0000ABC10179538F AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG61', N'_____ is your mother''s sister feeling today?', N'How', N'What', N'Why', N'Which', CAST(0x0000ABC201703545 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG62', N'_____ is your mother''s sister''s son feeling today?', N'How', N'What', N'Why', N'Which', CAST(0x0000ABC20171EB4A AS DateTime), N'ENG', 3)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG63', N'a', N'a', N'a', N'a', N'a', CAST(0x0000ABC20171F8FB AS DateTime), N'ENG', 3)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG64', N'a', N'a', N'a', N'a', N'a', CAST(0x0000ABC2017253CC AS DateTime), N'ENG', 3)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG65', N'a', N'a', N'a', N'a', N'a', CAST(0x0000ABC2017264A8 AS DateTime), N'ENG', 3)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG66', N'How do you feel today? -______.', N'Couldn''t have been better!', N'I ate breakfast.', N'I hate that.', N'How about you?', CAST(0x0000ABC7016B0FDB AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG7', N'Whiskey gets better and better as it ______.', N'ages', N'age', N'ageing', N'aged', CAST(0x0000ABC101795386 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG8', N'Pamela ______ a big lunch and now she''s sleepy.', N'ate', N'eats', N'eaten', N'eating', CAST(0x0000ABC101795386 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'ENG9', N'I have never ______ such a boring book!', N'read', N'saw', N'readed', N'red', CAST(0x0000ABC101795386 AS DateTime), N'ENG', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ3111', N'Swing components that don''t rely on native GUI are referred to as ___________.', N'lightweight components', N'heavyweight components', N'GUI components', N'non-GUI components', CAST(0x0000ABC200AA877B AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31110', N'What is best to describe the relationship between Component and Color?', N'Association', N'Aggregation', N'Composition', N'Inheritance', CAST(0x0000ABC200AA8783 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31111', N'Which of the following classes are in the java.awt package?', N'Color', N'None of the others', N'JComponent', N'JFrame', CAST(0x0000ABC200AA8783 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31112', N'Which of the following statements is for placing the frame''s upper left corner to (200, 100)?', N'frame.setLocation(200, 100)', N'frame.setLocation(100, 100)', N'frame.setLocation(100, 200)', N'frame.setLocation(200, 200)', CAST(0x0000ABC200AA8783 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31113', N'What layout manager should you use so that every component occupies the same size in the container?', N'a GridLayout', N'a FlowLayout', N'a BorderLayout', N'any layout', CAST(0x0000ABC200AA8783 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31114', N'__________ should be used to position a Button so that the size of the Button is NOT affected by the Frame size.', N'a FlowLayout', N'a GridLayout', N'the center area of a BorderLayout', N'the East or West area of a BorderLayout', CAST(0x0000ABC200AA8784 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31115', N'Suppose a JFrame uses the GridLayout(2, 2). If you add six buttons to the frame, how many columns are displayed?', N'3', N'1', N'2', N'4', CAST(0x0000ABC200AA8784 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31116', N'Suppose a JFrame uses the GridLayout(0, 2). If you add six buttons to the frame, how many columns are displayed?', N'2', N'1', N'3', N'4', CAST(0x0000ABC200AA8784 AS DateTime), N'PRJ311', 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31117', N'The default layout out of a contentPane in a JFrame is __________.', N'BorderLayout', N'FlowLayout', N'GridLayout', N'None', CAST(0x0000ABC200AA8784 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31118', N'The default layout out of a JPanel is __________.', N'FlowLayout', N'GridLayout', N'BorderLayout', N'None', CAST(0x0000ABC200AA8785 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31119', N'To create a JPanel of the BorderLayout, use ______________.', N'JPanel p = new JPanel(new BorderLayout());', N'JPanel p = new JPanel();', N'JPanel p = new JPanel(BorderLayout());', N'JPanel p = new JPanel().setLayout(new BorderLayout());', CAST(0x0000ABC200AA8785 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ3112', N'__________ are referred to as heavyweight components.', N'AWT components', N'Swing components', N'GUI components', N'Non-GUI components', CAST(0x0000ABC200AA8781 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31120', N'To add a component c to a JPanel p, use _________.', N'p.add(c)', N'p.getContentPane(c)', N'p.insert(c)', N'p.append(c)', CAST(0x0000ABC200AA8785 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31121', N'Which color is the darkest?', N'new Color(0, 0, 0)', N'new Color(10, 0, 0)', N'new Color(20, 0, 0)', N'new Color(30, 0, 0)', CAST(0x0000ABC200AA8786 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31122', N'The method __________ sets the font (Helvetica, 20-point bold).', N'setFont(new Font("Helvetica", Font.BOLD, 20))', N'setFont(new Font("Helvetica", Font.bold, 20))', N'setFont(new Font("helvetica", BOLD, 20))', N'setFont(Font("Helvetica", Font.BOLD, 20))', CAST(0x0000ABC200AA8786 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31123', N'The setBackground method can be used to set a back ground color for _____.', N'All of the others', N'Component', N'Container', N'JComponent', CAST(0x0000ABC200AA8786 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31124', N'The setBorder method can be used to set a border for _____.', N'JComponent', N'Component', N'Container', N'All of the others', CAST(0x0000ABC200AA8787 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31125', N'You can use methods ___________ on any instance of java.awt.Component.', N'setBackground', N'setBorder', N'setLayout', N'All of the others', CAST(0x0000ABC200AA8787 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31126', N'To create an image icon for a file in c:\book\image\icon, use ____________.', N'new ImageIcon("c:\\book\\image\\icon");', N'new ImageIcon("c:\book\image\icon");', N'new ImageIcon(''c:\book\image\icon'');', N'new ImageIcon(''c:\\book\\image\\icon'');', CAST(0x0000ABC200AA8787 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31127', N'Which of the following is true?', N'All of the others.', N'You can create a JButton by specifying an icon.', N'You can create a JButton by a text.', N'E. You can create a JButton using its default constructor.', CAST(0x0000ABC200AA8787 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31128', N'The method __________ gets the text (or caption) of the button b.', N'b.getText()', N'b.text()', N'b.findText()', N'b.retrieveText().', CAST(0x0000ABC200AA8787 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31129', N'The method __________ creates a IconImage for file c:\image\us.gif.', N'new ImageIcon("c:\\image\\us.gif");', N'new ImageIcon("c:\image\us.gif");', N'new Icon("c:\image\us.gif");', N'new Icon("c:\\image\\us.gif");', CAST(0x0000ABC200AA8787 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ3113', N'Which of the following statements are true?', N'A container such as JFrame is also a component.', N'Every instance of Component can be added to a container.', N'All Swing GUI components are lightweight.', N'Swing GUI component classes are named with a prefix S.', CAST(0x0000ABC200AA8781 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31130', N'Which of the following are valid methods on the button jbt?', N'All of the others', N'jbt.setMnemonic(''A'');', N'jbt.setIconTextGap(50);', N'None of the others', CAST(0x0000ABC200AA8788 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31131', N'_________ checks whether the JCheckBox check is selected.', N'check.isSelected()', N'check.getSelected()', N'check.selected()', N'check.select()', CAST(0x0000ABC200AA8788 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31132', N'Which of the following statements are true?', N'All of the others.', N'JCheckBox inherits from javax.swing.AbstractButton.', N'All the methods in JCheckBox are also in JButton.', N'You can use an icon on JCheckBox.', CAST(0x0000ABC200AA8788 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31133', N'Which of the following statements are true?', N'To check whether a radio button jrb is selected, use jrb.isSelected().', N'All of the others.', N'ButtonGroup can be added to a container.', N'When a radio button is created, the radio button is selected by default.', CAST(0x0000ABC200AA8788 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31134', N'The method __________ assigns the name Result to the Text of variable jlbl.', N'jlbl.setText("Result")', N'jlbl.newText("Result")', N'jlbl.text("Result")', N'jlbl.findText()', CAST(0x0000ABC200AA8789 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31135', N'___________ can be used to enter or display a string.', N'A text field', N'A label', N'A button', N'A check box', CAST(0x0000ABC200AA8789 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31136', N'Clicking a JButton object generates __________ events.', N'ActionEvent', N'ItemEvent', N'ComponentEvent', N'ContainerEvent', CAST(0x0000ABC200AA8789 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31137', N'The method __________ appends a string s into the text area jta.', N'jta.append(s)', N'jta.appendString(s)', N'jta.appendText(s)', N'jta.insertText(s)', CAST(0x0000ABC200AA8789 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31138', N'Which of the following statements are true?', N'You can specify the number of columns in a text area.', N'You can specify a horizontal text alignment in a text area.', N'You cannot disable editing on a text area.', N'All of the others.', CAST(0x0000ABC200AA8789 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31139', N'To wrap a line in a text area jta, invoke ____________.', N'jta.setLineWrap(true)', N'jta.setLineWrap(false)', N'jta.WrapLine()', N'jta.wrapText()', CAST(0x0000ABC200AA878A AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ3114', N'Which of the following classes is a heavyweight component?', N'JFrame', N'JButton', N'JTextField', N'JPanel', CAST(0x0000ABC200AA8782 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31140', N'The method __________ adds a text area jta to a scrollpane jScrollPane.', N'jScrollPane.add(jta)', N'jScrollPane.insert(jta)', N'jScrollPane.addItem(jta)', N'None of the others', CAST(0x0000ABC200AA878A AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31141', N'How many items can be selected from a JComboBox object at a time?', N'1', N'0', N'2', N'Unlimited', CAST(0x0000ABC200AA878A AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31142', N'_______________ returns the selected item on a JComboBox jcbo.', N'jcbo.getSelectedItem()', N'jcbo.getSelectedIndex()', N'jcbo.getSelectedIndices()', N'jcbo.getSelectedItems()', CAST(0x0000ABC200AA878A AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31143', N'The method __________ adds an item s into a JComboBox jcbo.', N'jcbo.addItem(s)', N'jcbo.add(s)', N'jcbo.addChoice(s)', N'jcbo.addObject(s)', CAST(0x0000ABC200AA878B AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31144', N'____________ is a component that enables the user to choose a single value or multiple values.', N'A list', N'A text field', N'A combo box', N'A label', CAST(0x0000ABC200AA878B AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31145', N'______________ allows selections of multiple contiguous items without restrictions.', N'Multiple-interval selection', N'Multiple selection', N'ALl of the others', N'Single selection', CAST(0x0000ABC200AA878C AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31146', N'Clicking a JList object generates __________ events.', N'ActionEvent and ItemEvent', N'ItemEvent and ComponentEvent', N'ComponentEvent and ContainerEvent', N'ActionEvent and ContainerEvent', CAST(0x0000ABC200AA878C AS DateTime), N'PRJ311', 3)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31147', N'The following is a property of a JScrollBar.', N'All of the others', N'maximum', N'orientation', N'visibleAmount', CAST(0x0000ABC200AA878C AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31148', N'The coordinate of the upper-left corner of a frame is __________.', N'(0, 0)', N'(25, 25)', N'(100, 100)', N'(10, 10)', CAST(0x0000ABC200AA878C AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31149', N'The header for the paintComponent method is ________________.', N'protected void paintComponent(Graphics g)', N'private void paintComponent(Graphics g)', N'public void paintComponent(Graphics g)', N'protected void paintComponent()', CAST(0x0000ABC200AA878C AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ3115', N'Which component cannot be added to a container?', N'JFrame', N'JPanel', N'JButton', N'JComponent', CAST(0x0000ABC200AA8782 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31150', N'You should override the __________ method to draw things on a Swing component.', N'paintComponent()', N'repaint()', N'update()', N'init()', CAST(0x0000ABC200AA878D AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31151', N'To repaint graphics, invoke __________ on a Swing component.', N'repaint()', N'update()', N'paintComponent()', N'init()', CAST(0x0000ABC200AA878D AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31152', N'The __________ method is used to create an Image object from an ImageIcon object imageIcon.', N'imageIcon.getImage()', N'imageIcon.image()', N'imageIcon.setImage()', N'imageIcon.returnImage()', CAST(0x0000ABC200AA878D AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31153', N'When creating a server on a port that is already in use, __________.', N'java.net.BindException occurs.', N'the server is created with no problems.', N'the server is blocked until the port is available.', N'the server encounters a fatal error and must be terminated.', CAST(0x0000ABC200AA878D AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31154', N'When creating a client on a server port that is already in use, __________.', N'the client can connect to the server regardless of whether the port is in use.', N'java.net.BindException occurs.', N'the client is blocked until the port is available.', N'the client encounters a fatal error and must be terminated.', CAST(0x0000ABC200AA878D AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31155', N'The server listens for a connection request from a client using the following statement:', N'Socket s = serverSocket.accept();', N'Socket s = new Socket(ServerName, port);', N'Socket s = serverSocket.getSocket();', N'Socket s = new Socket(ServerName);', CAST(0x0000ABC200AA878E AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31156', N'When a client requests connection to a server that has not yet started, __________.', N'java.net.ConnectionException occurs.', N'java.net.BindException occurs.', N'the client is blocked until the server is started.', N'the client encounters a fatal error and must be terminated.', CAST(0x0000ABC200AA878E AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31157', N'To create an InputStream on a socket s, you use __________.', N'InputStream in = s.getInputStream();', N'InputStream in = new InputStream(s);', N'InputStream in = s.obtainInputStream();', N'InputStream in = s.getStream();', CAST(0x0000ABC200AA878E AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31158', N'You can invoke ______________ on a Socket s, to obtain an InetAddress object.', N's.InetAddress();', N's.getInetAddress();', N's.obtainInetAddress();', N's.retrieveInetAddress();', CAST(0x0000ABC200AA878E AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31159', N'The ____________ method in the InetAddress class returns the IP address.', N'getHostAddress()', N'getIP()', N'getIPAddress()', N'getAddress()', CAST(0x0000ABC200AA878F AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ3116', N'Which of the following is a subclass of java.awt.Component?', N'Container classes', N'All of the others', N'Helper classes such as Color and Font', N'None of the others', CAST(0x0000ABC200AA8782 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31160', N'A ServerSocket can connect to ________ clients.', N'an unlimited number of', N'one', N'two', N'ten', CAST(0x0000ABC200AA878F AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31161', N'The _____ layout places the components in rows and columns.', N'GridLayout', N'CardLayout', N'FlowLayout', N'Borderlayout', CAST(0x0000ABC200AA878F AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31162', N'The default alignment of buttons in Flow Layout is ________.', N'CENTER', N'RIGHT', N'LEFT', N'The alignment must be defined when using the FlowLayout Manager.', CAST(0x0000ABC200AA878F AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31163', N'The default horizontal and vertical gap in BorderLayout is ________.', N'0 pixel', N'1 pixel', N'5 pixels', N'10 pixels', CAST(0x0000ABC200AA878F AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31164', N'Which method is used to load a JDBC driver?', N'Class.forName()', N'class.load()', N'Class.load()', N'class.forName()', CAST(0x0000ABC200AA8790 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31165', N'Which method is used to commit the update of a ResultSet?', N'updateRow()', N'CommitRow()', N'commit()', N'update()', CAST(0x0000ABC200AA8790 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31166', N'Which statements are INCORRECT about I18N?', N'The translation of text is the least time-consuming part of the localization process', N'Textual elements are stored outside the source code and retrieved dynamically', N'Localization is the process of adapting software for a specific region', N'None of the others', CAST(0x0000ABC200AA8790 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31167', N'________ driver can interpret JDBC calls to the database-specific native call interface.', N'Type-2', N'Type-1', N'Type-4', N'Type-3', CAST(0x0000ABC200AA8790 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31168', N'________ driver can use a bridging technology that provides JDBC access via ODBC drivers.', N'Type-1', N'Type-4', N'Type-2', N'Type-3', CAST(0x0000ABC200AA8790 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31169', N'The _______ method wakes up all threads that are waiting for a monitor.', N'notifyAll()', N'notify()', N'join()', N'wait()', CAST(0x0000ABC200AA8790 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ3117', N'What is best to describe the relationship between a container and a SWing GUI object in the container?', N'Composition', N'Association', N'Aggregation', N'Inheritance', CAST(0x0000ABC200AA8782 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31170', N'What is the name of the Swing class that is used for frames?', N'JFrame', N'Window', N'Frame', N'SwingFrame', CAST(0x0000ABC200AA8791 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31171', N'What method sets the size of the displayed JFrame?', N'setSize( int width, int height)', N'setSize( int height, int width)', N'setVisible( int width, int height)', N'setVisible( int height, int width)', CAST(0x0000ABC200AA8791 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31172', N'The size of a frame on the screen is measured in:', N'pixels', N'inches', N'nits', N'dots', CAST(0x0000ABC200AA8791 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31173', N'What is the one component that nearly all GUI programs will have?', N'Frame', N'Mouse', N'Monitor', N'Button', CAST(0x0000ABC200AA8791 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31174', N'What is S?', N'as', N'hj', N'gggggg', N'ghf', CAST(0x0000ABC50152424D AS DateTime), N'PRJ311', 3)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ31175', N'What is S?', N'sda', N'asd', N'sad', N'asd', CAST(0x0000ABC7016A9522 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ3118', N'What is best to describe the relationship between a container and a layout manager?', N'Aggregation', N'Association', N'Composition', N'Inheritance', CAST(0x0000ABC200AA8782 AS DateTime), N'PRJ311', 1)
INSERT [dbo].[QuestionBank] ([id], [question_content], [correct_answer], [answer_one], [answer_two], [answer_three], [createDate], [subjectId], [status]) VALUES (N'PRJ3119', N'What is best to describe the relationship between JComponent and JButton?', N'Inheritance', N'Association', N'Aggregation', N'Composition', CAST(0x0000ABC200AA8783 AS DateTime), N'PRJ311', 1)
/****** Object:  Table [dbo].[Registration]    Script Date: 08/14/2020 01:20:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registration](
	[email] [varchar](50) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[name] [varchar](max) NOT NULL,
	[role] [varchar](50) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Registration] ([email], [password], [name], [role], [status]) VALUES (N'123456@fpt.edu.vn', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'John', N'Student', 2)
INSERT [dbo].[Registration] ([email], [password], [name], [role], [status]) VALUES (N'1234567@fpt.edu.vn', N'8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414', N'Kimmy', N'Student', 2)
INSERT [dbo].[Registration] ([email], [password], [name], [role], [status]) VALUES (N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'admin', N'admin', 2)
INSERT [dbo].[Registration] ([email], [password], [name], [role], [status]) VALUES (N'treiajd@fpt.edu.vn', N'b852246bc57342c4b3360ea8704db505b71c37c987275d312ecd99ed0d5f7ce9', N'Tre ia', N'Student', 1)
INSERT [dbo].[Registration] ([email], [password], [name], [role], [status]) VALUES (N'tringse140329@fpt.edu.vn', N'63fec6d80865d47ecac5a5022d71e008ffda54747f24ec967147c09b048f3e03', N'Tri Minh Nguyen', N'Student', 1)
INSERT [dbo].[Registration] ([email], [password], [name], [role], [status]) VALUES (N'trinmse140329@fpt.edu.vn', N'c3698e3237a596f442272a6b7622e512ede18ab929479eb928472f06cbe1203', N'Tri Nguyen', N'Student', 2)
/****** Object:  Table [dbo].[Record]    Script Date: 08/14/2020 01:20:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Record](
	[id] [varchar](50) NOT NULL,
	[subjectId] [varchar](50) NOT NULL,
	[studentId] [varchar](50) NOT NULL,
	[submit_time] [datetime] NOT NULL,
	[time_taken] [int] NOT NULL,
	[question_correct] [int] NOT NULL,
	[point] [float] NOT NULL,
 CONSTRAINT [PK_Record] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Record] ([id], [subjectId], [studentId], [submit_time], [time_taken], [question_correct], [point]) VALUES (N'ENG1', N'ENG', N'123456@fpt.edu.vn', CAST(0x0000ABCA00CEC3DC AS DateTime), 612, 28, 9.33)
INSERT [dbo].[Record] ([id], [subjectId], [studentId], [submit_time], [time_taken], [question_correct], [point]) VALUES (N'ENG2', N'ENG', N'123456@fpt.edu.vn', CAST(0x0000ABCB00CC212A AS DateTime), 612, 0, 0)
INSERT [dbo].[Record] ([id], [subjectId], [studentId], [submit_time], [time_taken], [question_correct], [point]) VALUES (N'ENG3', N'ENG', N'123456@fpt.edu.vn', CAST(0x0000ABCB01353A03 AS DateTime), 2700, 8, 2.67)
INSERT [dbo].[Record] ([id], [subjectId], [studentId], [submit_time], [time_taken], [question_correct], [point]) VALUES (N'ENG4', N'ENG', N'123456@fpt.edu.vn', CAST(0x0000ABCB0142FADB AS DateTime), 218, 30, 10)
INSERT [dbo].[Record] ([id], [subjectId], [studentId], [submit_time], [time_taken], [question_correct], [point]) VALUES (N'ENG5', N'ENG', N'123456@fpt.edu.vn', CAST(0x0000ABCC00ABFF49 AS DateTime), 101, 6, 2)
INSERT [dbo].[Record] ([id], [subjectId], [studentId], [submit_time], [time_taken], [question_correct], [point]) VALUES (N'ENG6', N'ENG', N'trinmse140329@fpt.edu.vn', CAST(0x0000ABCC00AECD8A AS DateTime), 570, 24, 8)
/****** Object:  ForeignKey [FK_QuestionBank_Status]    Script Date: 08/14/2020 01:20:31 ******/
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD  CONSTRAINT [FK_QuestionBank_Status] FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([statusId])
GO
ALTER TABLE [dbo].[QuestionBank] CHECK CONSTRAINT [FK_QuestionBank_Status]
GO
/****** Object:  ForeignKey [FK_QuestionBank_Subject]    Script Date: 08/14/2020 01:20:31 ******/
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD  CONSTRAINT [FK_QuestionBank_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[QuestionBank] CHECK CONSTRAINT [FK_QuestionBank_Subject]
GO
/****** Object:  ForeignKey [FK_Registration_Status]    Script Date: 08/14/2020 01:20:31 ******/
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Status] FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([statusId])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Status]
GO
/****** Object:  ForeignKey [FK_Record_Registration]    Script Date: 08/14/2020 01:20:31 ******/
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Registration] FOREIGN KEY([studentId])
REFERENCES [dbo].[Registration] ([email])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Registration]
GO
/****** Object:  ForeignKey [FK_Record_Subject]    Script Date: 08/14/2020 01:20:31 ******/
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Subject]
GO
