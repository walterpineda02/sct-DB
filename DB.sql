USE [master]
GO
IF DB_ID(N'sct') IS NOT NULL
DROP DATABASE [sct];
GO
CREATE DATABASE [sct];
GO

USE [sct];

GO
ALTER DATABASE [sct] SET COMPATIBILITY_LEVEL = 120
GO
 
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sct].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sct] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [sct] SET ANSI_NULLS ON 
GO
ALTER DATABASE [sct] SET ANSI_PADDING ON 
GO
ALTER DATABASE [sct] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [sct] SET ARITHABORT ON 
GO
ALTER DATABASE [sct] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sct] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sct] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sct] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sct] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [sct] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [sct] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sct] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [sct] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sct] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sct] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sct] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sct] SET TRUSTWORTHY ON 
GO
ALTER DATABASE [sct] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sct] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sct] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sct] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sct] SET RECOVERY FULL 
GO
ALTER DATABASE [sct] SET  MULTI_USER 
GO
ALTER DATABASE [sct] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [sct] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sct] SET FILESTREAM( NON_TRANSACTED_ACCESS = FULL ) 
GO
ALTER DATABASE [sct] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [sct] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'sct', N'ON'


/*GO
USE [sct];
GO*/

IF OBJECT_ID('dbo.Rol','U') IS NOT NULL
DROP TABLE Rol;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[IdEstadoRegistro] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[DireccionEquipoCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[DireccionEquipoModificacion] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID('dbo.Usuario','U') IS NOT NULL
DROP TABLE Usuario;
GO
CREATE TABLE dbo.Usuario(
IdUsuario [int] IDENTITY(1,1) NOT NULL,
IdRol [tinyint] NOT NULL,
Nombres nvarchar(100) NOT NULL,
Apellidos nvarchar(100) NOT NULL,
Sexo nvarchar(1) NOT NULL,
DNI nvarchar(16) NOT NULL,
FechaNacimiento nvarchar(20) not null,
Telefono nvarchar(20) ,
Correo nvarchar(100),
Direccion nvarchar(500) not null,
Ciudad nvarchar(100) not null,
Pais nvarchar(100) not null,
Usuario nvarchar(40) ,
Contraseña nvarchar(100) not null,
Activo int not null,
IdEstadoRegistro            BIT            NOT NULL,
FechaCreacion               DATETIME       NOT NULL,
IdUsuarioCreacion           INT            NOT NULL,
DireccionEquipoCreacion     VARCHAR (25)   NOT NULL,
FechaModificacion           DATETIME       NOT NULL,
IdUsuarioModificacion       INT            NOT NULL,
DireccionEquipoModificacion VARCHAR (25)   NOT NULL
CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[Usuario] WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID(N'dbo.Categoria', 'U') IS NOT NULL
DROP TABLE [dbo].[Categoria];
GO
CREATE TABLE [dbo].[Categoria] (
	[IdCategoria] [int] IDENTITY(1,1)  NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[IdEstadoRegistro] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[DireccionEquipoCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[DireccionEquipoModificacion] [varchar](25) NOT NULL
CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID(N'dbo.Equipo', 'U') IS NOT NULL
DROP TABLE [dbo].[Equipo];
GO
CREATE TABLE [dbo].[Equipo] (
	[IdEquipo] [int] IDENTITY(1,1)  NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Marca] [varchar](100) NOT NULL,
	[Modelo] [varchar](100) NOT NULL,
	[Serie] [varchar](100) NOT NULL,
	[Color] [varchar](100) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[IdEstadoRegistro] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[DireccionEquipoCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[DireccionEquipoModificacion] [varchar](25) NOT NULL
CONSTRAINT [PK_Equipo] PRIMARY KEY CLUSTERED 
(
	[IdEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[Equipo]  WITH CHECK ADD  CONSTRAINT [FK_Equipo_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Equipo] CHECK CONSTRAINT [FK_Equipo_Categoria]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID(N'dbo.Reparacion', 'U') IS NOT NULL
DROP TABLE [dbo].[Reparacion];
GO
CREATE TABLE [dbo].[Reparacion](
	[IdReparacion] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioCliente] [int] NOT NULL,
	[IdUsuarioTrabajador] [int] NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[FechaSalida] [datetime],
	[Estado] [varchar] (100) NOT NULL, 
	[IdEstadoRegistro] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[DireccionEquipoCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[DireccionEquipoModificacion] [varchar](25) NOT NULL
 CONSTRAINT [PK_Reparacion] PRIMARY KEY CLUSTERED 
(
	[IdReparacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[Reparacion]  
WITH CHECK ADD  CONSTRAINT [FK_Reparacion_UsuarioCliente]
FOREIGN KEY([IdUsuarioCliente])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Reparacion] CHECK CONSTRAINT [FK_Reparacion_UsuarioCliente]
GO
ALTER TABLE [dbo].[Reparacion]
WITH CHECK ADD CONSTRAINT [FK_Reparacion_UsuarioTrabajador]
FOREIGN KEY([IdUsuarioTrabajador]) REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Reparacion] CHECK CONSTRAINT [FK_Reparacion_UsuarioTrabajador]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID(N'dbo.DetalleReparacion', 'U') IS NOT NULL
DROP TABLE [dbo].[DetalleReparacion];
GO
CREATE TABLE [dbo].[DetalleReparacion] (
[IdDetalleReparacion] [int] IDENTITY(1,1) NOT NULL,
[IdReparacion] [int] NOT NULL,
[IdEquipo] [int] NOT NULL,
[ProblemaReportado] [varchar] (500) NOT NULL,
[Observacion] [varchar] (300) NOT NULL,  
CONSTRAINT [PK_DetalleReparacion] PRIMARY KEY CLUSTERED
(
	[IdDetalleReparacion] ASC
)WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF ,ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[DetalleReparacion] WITH CHECK ADD CONSTRAINT [FK_DetalleReparacion_Reparacion]
FOREIGN KEY([IdReparacion]) REFERENCES [dbo].[Reparacion] ([IdReparacion])
GO
ALTER TABLE [dbo].[DetalleReparacion] CHECK CONSTRAINT [FK_DetalleReparacion_Reparacion]
GO
ALTER TABLE [dbo].[DetalleReparacion] WITH CHECK ADD CONSTRAINT [FK_DetalleReparacion_Equipo]
FOREIGN KEY([IdEquipo]) REFERENCES [dbo].[Equipo] ([IdEquipo])
GO
ALTER TABLE [dbo].[DetalleReparacion] CHECK CONSTRAINT [FK_DetalleReparacion_Equipo]
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Auditoria](
	[IdAuditoria] [uniqueidentifier] NOT NULL,
	[NombreTabla] [varchar](150) NOT NULL,
	[Identificador] [varchar](500) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[DireccionEquipo] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Auditoria] PRIMARY KEY CLUSTERED 
(
	[IdAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditoriaDetalle](
	[IdAuditoria] [uniqueidentifier] NOT NULL,
	[NombreColumna] [varchar](100) NOT NULL,
	[ValorNuevo] [varchar](max) NOT NULL,
	[ValorAnterior] [varchar](max) NULL,
 CONSTRAINT [PK_AuditoriaDetalle] PRIMARY KEY CLUSTERED 
(
	[IdAuditoria] ASC,
	[NombreColumna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Archivo](
	[IdArchivo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[Extension] [varchar](10) NULL,
	[Ubicacion] [varchar](250) NULL,
	[Peso] [bigint] NULL,
	[IdEstadoRegistro] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[DireccionEquipoCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[DireccionEquipoModificacion] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Archivo] PRIMARY KEY CLUSTERED 
(
	[IdArchivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistorialDireccionEquipo](
	[Fecha] [date] NOT NULL,
	[DireccionEquipo] [varchar](25) NOT NULL,
	[CantidadPeticion] [int] NOT NULL CONSTRAINT [DF_HistorialDireccionEquipo_Contador]  DEFAULT ((0)),
	[FechaUltimaEjecucion] [datetime] NOT NULL,
 CONSTRAINT [PK_HistorialDireccionEquipo] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC,
	[DireccionEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [int] NOT NULL,
	[IdMenuPadre] [int] NULL,
	[Nombre] [varchar](150) NOT NULL,
	[IdPermiso] [varchar](100) NULL,
	[Icono] [varchar](150) NULL,
	[DireccionWeb] [varchar](150) NULL,
	[Orden] [int] NULL,
 CONSTRAINT [PK__Menu__4D7EA8E1B8161B7D] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParametroSistema](
	[IdParametroSistema] [varchar](150) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Valor] [varchar](500) NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[IdUsuarioModificacion] [int] NULL,
	[DireccionEquipoModificacion] [varchar](25) NULL,
 CONSTRAINT [PK_ParametroSistema] PRIMARY KEY CLUSTERED 
(
	[IdParametroSistema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permiso](
	[IdPermiso] [varchar](100) NOT NULL,
	[IdModulo] [tinyint] NULL,
	[Descripcion] [varchar](500) NULL,
	[IdEstadoRegistro] [bit] NULL,
	[FechaCreacion] [datetime] NULL,
	[IdUsuarioCreacion] [int] NULL,
	[DireccionEquipoCreacion] [varchar](25) NULL,
	[FechaModificacion] [datetime] NULL,
	[IdUsuarioModificacion] [int] NULL,
	[DireccionEquipoModificacion] [varchar](25) NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[IdPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecuperacionContrasenaUsuario](
	[IdRecuperacionContrasenaUsuario] [varchar](50) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[FechaEmision] [datetime] NULL,
	[FechaExpiracion] [datetime] NOT NULL,
	[Autorizado] [bit] NOT NULL CONSTRAINT [DF_RecuperacionUsuario_Utilizado]  DEFAULT ((0)),
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[DireccionEquipoCreacion] [varchar](20) NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[DireccionEquipoModificacion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_RecuperacionUsuario] PRIMARY KEY CLUSTERED 
(
	[IdRecuperacionContrasenaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RolPermiso](
	[IdRol] [tinyint] NOT NULL,
	[IdPermiso] [varchar](100) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[DireccionEquipoCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[DireccionEquipoModificacion] [varchar](25) NOT NULL,
 CONSTRAINT [PK_RolPermiso] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC,
	[IdPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modulo](
	[IdModulo] [tinyint] NOT NULL,
	[IdModuloPadre] [tinyint] NULL,
	[Nombre] [varchar](150) NULL,
	[IdEstadoRegistro] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[DireccionEquipoCreacion] [varchar](25) NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[DireccionEquipoModificacion] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Modulo] PRIMARY KEY CLUSTERED 
(
	[IdModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO

