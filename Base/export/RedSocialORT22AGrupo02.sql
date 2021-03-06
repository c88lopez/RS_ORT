USE [master]
GO
IF DB_ID (N'RedSocialORT22AGrupo02') IS NOT NULL  
DROP DATABASE [RedSocialORT22AGrupo02];  
GO  
/****** Object:  Database [RedSocialORT22AGrupo02]    Script Date: 5/10/2016 22:13:47 ******/
CREATE DATABASE [RedSocialORT22AGrupo02] 
/*ON  PRIMARY 
( NAME = N'RedSocialORT22AGrupo02', FILENAME = N'RedSocialORT22AGrupo02.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RedSocialORT22AGrupo02_log', FILENAME = N'RedSocialORT22AGrupo02_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB)
*/
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RedSocialORT22AGrupo02].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ARITHABORT OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET RECOVERY FULL 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET  MULTI_USER 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RedSocialORT22AGrupo02', N'ON'
GO
USE [RedSocialORT22AGrupo02]
GO
/****** Object:  User [RedSocialORT]    Script Date: 5/10/2016 22:13:47 ******/
IF NOT EXISTS (SELECT name FROM [sys].[server_principals] WHERE name = N'RedSocialORT')
BEGIN
    CREATE USER [RedSocialORT] FOR LOGIN [RedSocialORT] WITH DEFAULT_SCHEMA=[dbo]
END

GO
ALTER ROLE [db_owner] ADD MEMBER [RedSocialORT]
GO
/****** Object:  Table [dbo].[Amigo]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amigo](
	[UsuarioID] [int] NOT NULL,
	[UsuarioIDAmigo] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
 CONSTRAINT [PK_Amigo] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC,
	[UsuarioIDAmigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[ComentarioID] [int] NOT NULL,
	[PublicacionID] [int] NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[ComentarioTexto] [nchar](144) NOT NULL,
	[ComentarioCalificacion] [int] NOT NULL,
	[ComentarioFechaActualizacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[ComentarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[GrupoID] [int] NOT NULL,
	[GrupoNombre] [nchar](30) NOT NULL,
	[GrupoDescripcion] [nchar](100) NULL,
	[GrupoFechaCreacion] [datetime] NOT NULL,
	[GrupoFechaActualizacion] [datetime] NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[GrupoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GrupoUsuario]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupoUsuario](
	[GrupoID] [int] NOT NULL,
	[UsuarioID] [int] NOT NULL,
 CONSTRAINT [PK_GrupoUsuario] PRIMARY KEY CLUSTERED 
(
	[GrupoID] ASC,
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mensaje]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensaje](
	[MensajeID] [int] IDENTITY(1,1) NOT NULL,
	[GrupoID] [int] NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[MensajeFecha] [datetime] NOT NULL,
	[MensajeTexto] [varchar](max) NULL,
 CONSTRAINT [PK_Mensaje] PRIMARY KEY CLUSTERED 
(
	[MensajeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicacion](
	[PublicacionID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[GrupoID] [int] NULL,
	[Descripcion] [nchar](144) NOT NULL,
	[PublicacionActualizacion] [datetime] NOT NULL,
	[PublicacionCalificacion] [int] NOT NULL,
	[PublicacionImagen] [varbinary](max) NULL,
 CONSTRAINT [PK_Publicacion] PRIMARY KEY CLUSTERED 
(
	[PublicacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitud](
	[SolicitudID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[UsuarioIDSolicita] [int] NOT NULL,
	[SolicitudEstadoID] [tinyint] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Solicitud] PRIMARY KEY CLUSTERED 
(
	[SolicitudID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] IDENTITY(1000,1) NOT NULL,
	[UsuarioNombre] [nvarchar](30) NOT NULL,
	[UsuarioApellido] [nvarchar](30) NOT NULL,
	[UsuarioEmail] [nvarchar](100) NOT NULL,
	[UsuarioPassword] [nvarchar](100) NOT NULL,
	[UsuarioFechaNacimiento] [date] NOT NULL,
	[UsuarioSexo] [nchar](1) NOT NULL,
	[UsuarioFoto] [nvarchar](100) NULL,
	[UsuarioFechaRegistracion] [datetime] NOT NULL,
	[UsuarioFechaActualizacion] [datetime] NULL,
	[UsuarioFotoActual] [varbinary](max) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Amigo] ADD  CONSTRAINT [DF_Amigo_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Solicitud] ADD  CONSTRAINT [DF_Solicitud_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Publicacion] FOREIGN KEY([PublicacionID])
REFERENCES [dbo].[Publicacion] ([PublicacionID])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Publicacion]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Usuario]
GO
ALTER TABLE [dbo].[GrupoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_GrupoUsuario_Grupo] FOREIGN KEY([GrupoID])
REFERENCES [dbo].[Grupo] ([GrupoID])
GO
ALTER TABLE [dbo].[GrupoUsuario] CHECK CONSTRAINT [FK_GrupoUsuario_Grupo]
GO
ALTER TABLE [dbo].[GrupoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_GrupoUsuario_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[GrupoUsuario] CHECK CONSTRAINT [FK_GrupoUsuario_Usuario]
GO
ALTER TABLE [dbo].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK_Publicacion_Grupo] FOREIGN KEY([GrupoID])
REFERENCES [dbo].[Grupo] ([GrupoID])
GO
ALTER TABLE [dbo].[Publicacion] CHECK CONSTRAINT [FK_Publicacion_Grupo]
GO
ALTER TABLE [dbo].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK_Publicacion_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Publicacion] CHECK CONSTRAINT [FK_Publicacion_Usuario]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Usuario]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Usuario1] FOREIGN KEY([UsuarioIDSolicita])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Usuario1]
GO
/****** Object:  StoredProcedure [dbo].[ComentarioInsert]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ComentarioInsert]

@PublicacionID int,
@UsuarioID int,
@ComentarioTexto nvarchar(144),
@ComentarioCalificacion int,
@ComentarioFechaActualizacion datetime

AS

INSERT INTO dbo.Comentario
(
PublicacionID,
UsuarioID,
ComentarioTexto,
ComentarioCalificacion,
ComentarioFechaActualizacion

)
VALUES
(
@PublicacionID,
@UsuarioID,
@ComentarioTexto,
@ComentarioCalificacion,
@ComentarioFechaActualizacion
)

RETURN SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[GrupoInsert]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrupoInsert]

@GrupoNombre nvarchar(30),
@GrupoDescripcion nvarchar(100),
@GrupoFechaCreacion datetime,
@GrupoFechaActualizacion datetime

AS

INSERT INTO dbo.Grupo
(
GrupoNombre,
GrupoDescripcion,
GrupoFechaCreacion,
GrupoFechaActualizacion
)
VALUES
(
@GrupoNombre,
@GrupoDescripcion,
@GrupoFechaCreacion,
@GrupoFechaActualizacion
)

RETURN SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[MensajeInsert]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MensajeInsert]

@GrupoID int,
@UsuarioID int,
@MensajeFecha datetime,
@MensajeTexto nvarchar(MAX)

AS

INSERT INTO dbo.Mensaje
(
GrupoID,
UsuarioID,
MensajeFecha,
MensajeTexto

)
VALUES
(
@GrupoID,
@UsuarioID,
@MensajeFecha,
@MensajeTexto
)

RETURN SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[PublicacionActualizarFoto]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PublicacionActualizarFoto]

@PublicacionID int,
@PublicacionImagen varbinary(MAX)

AS

UPDATE	Publicacion
SET		PublicacionImagen = @PublicacionImagen 
WHERE	PublicacionID = @PublicacionID

GO
/****** Object:  StoredProcedure [dbo].[PublicacionInsert]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PublicacionInsert]

@UsuarioID int,
@GrupoID int,
@Descripcion nvarchar(144),
@PublicacionActualizacion datetime,
@PublicacionCalificacion int,
@PublicacionImagen varbinary(MAX)

AS

INSERT INTO dbo.Publicacion
(
UsuarioID,
GrupoID,
Descripcion,
PublicacionActualizacion,
PublicacionCalificacion,
PublicacionImagen
)
VALUES
(
@UsuarioID,
@GrupoID,
@Descripcion,
@PublicacionActualizacion,
@PublicacionCalificacion,
@PublicacionImagen
)
RETURN SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[UsuarioActualizarFoto]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioActualizarFoto]

@UsuarioID int,
@UsuarioFoto nvarchar(100),
@UsuarioFotoActual varbinary(MAX)

AS

UPDATE	Usuario
SET		UsuarioFoto = @UsuarioFoto, UsuarioFotoActual = @UsuarioFotoActual
WHERE	UsuarioID = @UsuarioID

GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarEmail]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioBuscarEmail]

@UsuarioEmail nvarchar(100)

AS

IF EXISTS (SELECT * FROM Usuario WHERE UsuarioEmail = @UsuarioEmail)
	SELECT 1
ELSE
	SELECT 0

GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarPorEmailPassword]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioBuscarPorEmailPassword]

@UsuarioEmail nvarchar(100),
@UsuarioPassword nvarchar(100)

AS

SELECT	*
FROM	Usuario
WHERE	UsuarioEmail = @UsuarioEmail AND
		UsuarioPassword = @UsuarioPassword

GO
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 5/10/2016 22:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioInsert]

@UsuarioNombre nvarchar(30),
@UsuarioApellido nvarchar(30),
@UsuarioEmail nvarchar(100),
@UsuarioPassword nvarchar(100),
@UsuarioFechaNacimiento date,
@UsuarioSexo nchar(1),
@UsuarioFechaRegistracion datetime

AS

INSERT INTO Usuario
(
UsuarioNombre,
UsuarioApellido,
UsuarioEmail,
UsuarioPassword,
UsuarioFechaNacimiento,
UsuarioSexo,
UsuarioFechaRegistracion
)
VALUES
(
@UsuarioNombre,
@UsuarioApellido,
@UsuarioEmail,
@UsuarioPassword,
@UsuarioFechaNacimiento,
@UsuarioSexo,
@UsuarioFechaRegistracion
)

RETURN SCOPE_IDENTITY()

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Pendiente
2=Aceptada
3=Rechazada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solicitud', @level2type=N'COLUMN',@level2name=N'SolicitudEstadoID'
GO
USE [master]
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET  READ_WRITE 
GO
