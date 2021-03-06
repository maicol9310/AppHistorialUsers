USE [Test]
GO
/****** Object:  Table [dbo].[actividades]    Script Date: 01/10/2020 5:14:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actividades](
	[IdAct] [int] IDENTITY(1,1) NOT NULL,
	[Descr] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_actividades] PRIMARY KEY CLUSTERED 
(
	[IdAct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modulo]    Script Date: 01/10/2020 5:14:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_modulo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operaciones]    Script Date: 01/10/2020 5:14:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[idModulo] [int] NULL,
 CONSTRAINT [PK_operaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 01/10/2020 5:14:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol_operacion]    Script Date: 01/10/2020 5:14:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol_operacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[idOperacion] [int] NULL,
 CONSTRAINT [PK_perfil_operacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 01/10/2020 5:14:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](200) NULL,
	[fecha] [datetime] NULL,
	[idRol] [int] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[actividades] ON 

INSERT [dbo].[actividades] ([IdAct], [Descr], [Email]) VALUES (1, N'Trabajo 1', N'maicol_931028@hotmail.com')
INSERT [dbo].[actividades] ([IdAct], [Descr], [Email]) VALUES (2, N'Trabajo 2', N'maicol_931028@hotmail.com')
SET IDENTITY_INSERT [dbo].[actividades] OFF
GO
SET IDENTITY_INSERT [dbo].[modulo] ON 

INSERT [dbo].[modulo] ([id], [nombre]) VALUES (1, N'VerReg')
SET IDENTITY_INSERT [dbo].[modulo] OFF
GO
SET IDENTITY_INSERT [dbo].[operaciones] ON 

INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1, N'Ver', 1)
SET IDENTITY_INSERT [dbo].[operaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([id], [nombre]) VALUES (1, N'UsuVer')
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[rol_operacion] ON 

INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[rol_operacion] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [fecha], [idRol]) VALUES (3, N'Jan', N'maicol_931028@hotmail.com', N'123456789', CAST(N'2020-08-29T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[operaciones]  WITH CHECK ADD  CONSTRAINT [FK_operaciones_modulo] FOREIGN KEY([idModulo])
REFERENCES [dbo].[modulo] ([id])
GO
ALTER TABLE [dbo].[operaciones] CHECK CONSTRAINT [FK_operaciones_modulo]
GO
ALTER TABLE [dbo].[rol_operacion]  WITH CHECK ADD  CONSTRAINT [FK_rol_operacion_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([id])
GO
ALTER TABLE [dbo].[rol_operacion] CHECK CONSTRAINT [FK_rol_operacion_operaciones]
GO
ALTER TABLE [dbo].[rol_operacion]  WITH CHECK ADD  CONSTRAINT [FK_rol_operacion_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([id])
GO
ALTER TABLE [dbo].[rol_operacion] CHECK CONSTRAINT [FK_rol_operacion_rol]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_rol]
GO
/****** Object:  StoredProcedure [dbo].[InsertarAct]    Script Date: 01/10/2020 5:14:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertarAct] (@Descr    NVARCHAR(50),  
                                           @Email    NVARCHAR(50))  
AS  
  BEGIN  
            INSERT INTO actividades  
                        (Descr,
						 Email)  
            VALUES     ( @Descr,  
                         @Email) 

  END  
GO
