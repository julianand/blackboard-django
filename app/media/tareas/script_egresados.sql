USE [master]
GO
/****** Object:  Database [Egresados]    Script Date: 12/02/2019 9:30:49 a. m. ******/
CREATE DATABASE [Egresados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Egresados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Egresados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Egresados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Egresados_log.ldf' , SIZE = 57664KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Egresados] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Egresados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Egresados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Egresados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Egresados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Egresados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Egresados] SET ARITHABORT OFF 
GO
ALTER DATABASE [Egresados] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Egresados] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Egresados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Egresados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Egresados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Egresados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Egresados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Egresados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Egresados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Egresados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Egresados] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Egresados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Egresados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Egresados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Egresados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Egresados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Egresados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Egresados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Egresados] SET RECOVERY FULL 
GO
ALTER DATABASE [Egresados] SET  MULTI_USER 
GO
ALTER DATABASE [Egresados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Egresados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Egresados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Egresados] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Egresados]
GO
/****** Object:  User [egresados]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE USER [egresados] FOR LOGIN [egresados] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [egresados]
GO
/****** Object:  Schema [m2ss]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE SCHEMA [m2ss]
GO
/****** Object:  Table [dbo].[acta_renovacion]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acta_renovacion](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](255) NOT NULL,
	[nombre] [nvarchar](max) NOT NULL,
	[idConvenio] [bigint] NOT NULL,
 CONSTRAINT [PK_acta_renovacion_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[actividades_economicas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actividades_economicas](
	[id] [bigint] IDENTITY(245,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_actividades_economicas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[anuncios]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[anuncios](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](500) NOT NULL,
	[contenido] [varchar](max) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[fecha_cierre] [date] NOT NULL,
	[correo_contacto] [varchar](500) NOT NULL,
 CONSTRAINT [PK_anuncios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[anuncios_dependencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anuncios_dependencias](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idAnuncio] [bigint] NOT NULL,
	[idPrograma] [bigint] NOT NULL,
 CONSTRAINT [PK_anuncios_dependencias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[archivos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[archivos](
	[id] [bigint] IDENTITY(6,1) NOT NULL,
	[url] [nvarchar](max) NOT NULL,
	[idNoticia] [bigint] NULL,
	[titulo] [nvarchar](255) NULL,
	[idCategoria] [bigint] NOT NULL,
	[estado] [smallint] NULL,
 CONSTRAINT [PK_archivos_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[asistencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asistencias](
	[id] [bigint] IDENTITY(10,1) NOT NULL,
	[idConferenciaPeriodo] [bigint] NOT NULL,
	[idEstudiante] [bigint] NOT NULL,
	[valoracion] [bigint] NOT NULL,
	[asistio] [smallint] NULL,
 CONSTRAINT [PK_asistencias_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[asociaciones]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asociaciones](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idHoja] [bigint] NOT NULL,
	[nombre] [varchar](200) NOT NULL,
 CONSTRAINT [PK_asociaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cartas_prensentacion]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartas_prensentacion](
	[id] [bigint] IDENTITY(9,1) NOT NULL,
	[idEstudiante] [bigint] NOT NULL,
	[idEmpresa] [bigint] NOT NULL,
	[estado] [bigint] NOT NULL,
	[ciudadExpedicion] [nvarchar](255) NOT NULL,
	[radicado] [nvarchar](50) NULL,
	[anio] [nvarchar](20) NULL,
	[periodo] [nvarchar](5) NULL,
	[fecha] [date] NULL,
	[codigo_verificacion] [nvarchar](255) NULL,
	[nombre_archivo] [nvarchar](max) NULL,
 CONSTRAINT [PK_cartas_prensentacion_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categorias_archivos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias_archivos](
	[id] [bigint] IDENTITY(5,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_categorias_archivos_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[competencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[competencias](
	[id] [bigint] IDENTITY(5,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_competencias_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[competencias_hojadevida]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[competencias_hojadevida](
	[idHoja] [bigint] NOT NULL,
	[idCompetencia] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[concejos_profesionales]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[concejos_profesionales](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idHoja] [bigint] NOT NULL,
	[nombre] [varchar](200) NOT NULL,
 CONSTRAINT [PK_concejos_profesionales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[conferencia]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conferencia](
	[id] [bigint] IDENTITY(18,1) NOT NULL,
	[nombre] [nvarchar](200) NOT NULL,
	[valoracion] [real] NULL,
 CONSTRAINT [PK_conferencia_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[conferenciaprograma]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conferenciaprograma](
	[id] [bigint] IDENTITY(15,1) NOT NULL,
	[idConferencia] [bigint] NOT NULL,
	[idPrograma] [bigint] NOT NULL,
 CONSTRAINT [PK_conferenciaprograma_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[conferencias_periodos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conferencias_periodos](
	[id] [bigint] IDENTITY(13,1) NOT NULL,
	[idConferencia] [bigint] NOT NULL,
	[idPeriodo] [bigint] NOT NULL,
	[lugar] [nvarchar](150) NOT NULL,
	[fecha] [date] NOT NULL,
	[horaInicial] [nvarchar](10) NOT NULL,
	[horaFinal] [nvarchar](10) NOT NULL,
	[valoracion] [real] NULL,
	[orador] [bigint] NOT NULL,
	[cupo] [bigint] NOT NULL,
 CONSTRAINT [PK_conferencias_periodos_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contactos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contactos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idTipo] [int] NOT NULL,
	[nombre] [varchar](500) NOT NULL,
	[identificacion] [varchar](20) NOT NULL,
	[correo] [varchar](200) NOT NULL,
	[telefono] [varchar](20) NULL,
	[contenido] [varchar](max) NOT NULL,
 CONSTRAINT [PK_contactos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contratos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contratos](
	[id] [bigint] IDENTITY(7,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_contratos_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[convenios]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[convenios](
	[id] [bigint] IDENTITY(8,1) NOT NULL,
	[idEmpresa] [bigint] NOT NULL,
	[certificado_existencia] [nvarchar](max) NULL,
	[cedula_representante] [nvarchar](max) NULL,
	[procuraduria] [nvarchar](max) NULL,
	[contraloria] [nvarchar](max) NULL,
	[rut] [nvarchar](max) NULL,
	[acta_posesion] [nvarchar](max) NULL,
	[acto_administrativo] [nvarchar](max) NULL,
	[certificado_militar] [nvarchar](max) NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[estado] [bigint] NOT NULL,
	[minuta] [nvarchar](255) NULL,
	[convenio] [nvarchar](255) NULL,
	[observaciones] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_convenios_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[coordinador_programas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coordinador_programas](
	[id] [bigint] IDENTITY(22,1) NOT NULL,
	[idPrograma] [bigint] NOT NULL,
	[idCoordinador] [bigint] NOT NULL,
 CONSTRAINT [PK_coordinador_programas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[departamentos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamentos](
	[id] [bigint] IDENTITY(68,1) NOT NULL,
	[idPais] [bigint] NOT NULL,
	[nombre] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_departamentos_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dependencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dependencias](
	[id] [bigint] IDENTITY(26,1) NOT NULL,
	[nombre] [nvarchar](200) NOT NULL,
	[idTipo] [bigint] NOT NULL,
	[codigoPrograma] [nvarchar](10) NULL,
	[codigoPracticas] [nvarchar](255) NULL,
	[idNivelestudio] [int] NULL,
 CONSTRAINT [PK_dependencias_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dependencias_modalidades]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dependencias_modalidades](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idPrograma] [bigint] NOT NULL,
	[idModalidad] [int] NOT NULL,
	[idFacultad] [bigint] NULL,
	[idJornada] [bigint] NULL,
 CONSTRAINT [PK_dependencias_modalidades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[discapacidades]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[discapacidades](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
 CONSTRAINT [PK_discapacidades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[distinciones]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[distinciones](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idHoja] [bigint] NOT NULL,
	[nombre] [varchar](max) NOT NULL,
 CONSTRAINT [PK_distinciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[distinciones_estudiantes]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[distinciones_estudiantes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_distinciones_estudiantes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[documentos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[documentos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idEstudiante] [bigint] NOT NULL,
	[url_documento] [varchar](500) NOT NULL,
	[nombre_documento] [varchar](500) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[duraciones]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[duraciones](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_duraciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empresas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empresas](
	[id] [bigint] IDENTITY(9,1) NOT NULL,
	[idPersona] [bigint] NOT NULL,
	[nit] [nvarchar](20) NOT NULL,
	[nombre] [nvarchar](300) NOT NULL,
	[estadoDipro] [bigint] NULL,
	[estadoSil] [bigint] NULL,
	[motivo_cancelacion] [varchar](500) NULL,
	[idTipoNit] [bigint] NOT NULL,
	[idTipoEmpleador] [bigint] NOT NULL,
	[idActividadEconomica] [bigint] NOT NULL,
	[paginaWeb] [nvarchar](255) NULL,
	[file_nit] [nvarchar](max) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_empresas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empresas_hojavida]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresas_hojavida](
	[idEmpresa] [bigint] NOT NULL,
	[idHojavida] [bigint] NOT NULL,
	[fecha] [date] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[est_pazsalvo]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[est_pazsalvo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idPazsalvo] [int] NOT NULL,
	[idEstudiante] [bigint] NOT NULL,
	[paz_salvo] [tinyint] NOT NULL,
 CONSTRAINT [PK_est_pazsalvo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estado_cartas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_cartas](
	[id] [bigint] IDENTITY(4,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_estado_cartas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estado_convenio]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_convenio](
	[id] [bigint] IDENTITY(10,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_estado_convenio_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estado_ofertas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_ofertas](
	[id] [bigint] IDENTITY(7,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_estado_ofertas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estado_practicas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_practicas](
	[id] [bigint] IDENTITY(7,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_estado_practicas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estadocivil]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadocivil](
	[id] [bigint] IDENTITY(7,1) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_estadocivil_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estadoempresas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadoempresas](
	[id] [bigint] IDENTITY(5,1) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_estadoempresas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estadopostulados]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadopostulados](
	[id] [bigint] IDENTITY(5,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_estadopostulados_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estadopostuladosestudiante]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadopostuladosestudiante](
	[id] [bigint] IDENTITY(6,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_estadopostuladosestudiante_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estudiantes]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estudiantes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idPersona] [bigint] NOT NULL,
	[idPrograma] [bigint] NULL,
	[codigo] [nvarchar](20) NULL,
	[promedio] [int] NULL,
	[idTipo] [bigint] NOT NULL,
	[aprobo_prepracticas] [smallint] NULL,
	[periodo_prepracticas] [nvarchar](20) NULL,
	[folio] [varchar](10) NULL,
	[acta] [varchar](10) NULL,
	[libro] [varchar](10) NULL,
	[codigo_verificacion] [varchar](10) NULL,
	[censo] [bigint] NULL,
	[carnetizado] [bigint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[distincion] [bigint] NULL,
	[idZonal] [bigint] NULL,
 CONSTRAINT [PK_estudiantes_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estudiantes_modalidades]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudiantes_modalidades](
	[id] [bigint] IDENTITY(7,1) NOT NULL,
	[idEstudiante] [bigint] NULL,
	[idModalidad] [bigint] NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[periodo] [nvarchar](30) NULL,
	[nombre_arl] [nvarchar](255) NULL,
	[certificado_arl] [nvarchar](255) NULL,
	[certificado_salud] [nvarchar](255) NULL,
	[horario] [nvarchar](max) NULL,
	[observaciones] [nvarchar](max) NULL,
	[aprobacion_estudiante] [smallint] NULL,
	[fecha_aprobacion_estudiante] [date] NULL,
	[aprobacion_jefe] [smallint] NOT NULL,
	[fecha_aprobacion_jefe] [date] NULL,
	[aprobacion_dippro] [smallint] NULL,
	[fecha_aprobacion_dippro] [date] NULL,
	[estado] [bigint] NULL,
	[informe] [nvarchar](max) NULL,
	[file_carta_solicitud] [nvarchar](255) NULL,
	[file_certificado_laboral] [nvarchar](255) NULL,
	[file_existencia_empresa] [nvarchar](255) NULL,
	[file_afiliacion_ss] [nvarchar](255) NULL,
	[file_contrato] [nvarchar](255) NULL,
	[file_carta_colaboracion] [nvarchar](255) NULL,
	[file_cedula_relegal] [nvarchar](255) NULL,
	[file_carta_director_programa] [nvarchar](255) NULL,
	[file_formato_movilidad] [nvarchar](255) NULL,
	[file_pasaporte] [nvarchar](255) NULL,
	[file_visa] [nvarchar](255) NULL,
	[file_cedula] [nvarchar](255) NULL,
	[file_carnet] [nvarchar](255) NULL,
	[file_padres] [nvarchar](255) NULL,
	[file_estudiante] [nvarchar](255) NULL,
	[file_itinerario] [nvarchar](255) NULL,
	[file_seguro] [nvarchar](255) NULL,
	[proyecto_impacto] [smallint] NULL,
	[estado_ori] [smallint] NULL,
	[idCiudad] [bigint] NULL,
	[nombre_impacto] [nvarchar](max) NULL,
	[empresa] [nvarchar](max) NULL,
 CONSTRAINT [PK_estudiantes_modalidades_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estudiosrealizados]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudiosrealizados](
	[id] [bigint] IDENTITY(20,1) NOT NULL,
	[idHoja] [bigint] NOT NULL,
	[institucion] [nvarchar](255) NOT NULL,
	[titulo] [nvarchar](255) NOT NULL,
	[idMunicipio] [bigint] NOT NULL,
	[anioGrado] [bigint] NOT NULL,
	[mesGrado] [int] NULL,
	[observaciones] [nvarchar](max) NULL,
	[duracion] [int] NULL,
	[graduado] [bit] NULL,
 CONSTRAINT [PK_estudiosrealizados_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[evaluaciones]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluaciones](
	[id] [bigint] IDENTITY(11,1) NOT NULL,
	[idRolevaluador] [bigint] NOT NULL,
	[idRolevaluado] [bigint] NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[estado] [smallint] NOT NULL,
 CONSTRAINT [PK_evaluaciones_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[experiencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[experiencias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[experiencias_laborales]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[experiencias_laborales](
	[id] [bigint] IDENTITY(20,1) NOT NULL,
	[empresa] [nvarchar](255) NOT NULL,
	[cargo] [nvarchar](255) NOT NULL,
	[duracion] [bigint] NOT NULL,
	[funcioneslogros] [nvarchar](max) NOT NULL,
	[idHoja] [bigint] NOT NULL,
	[nivel_cargo_id] [bigint] NULL,
	[tipo_vinculacion_id] [bigint] NULL,
	[municipio_id] [bigint] NULL,
	[email] [nvarchar](100) NULL,
	[telefono] [nvarchar](50) NULL,
	[salario_id] [bigint] NULL,
 CONSTRAINT [PK_experiencias_laborales_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fecha_modalidad]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fecha_modalidad](
	[idFecha] [bigint] NOT NULL,
	[idModalidad] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fechas_de_grado]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fechas_de_grado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](500) NULL,
	[anio] [varchar](10) NOT NULL,
	[inscripcion_fecha_inicio] [date] NULL,
	[inscripcion_fecha_fin] [date] NULL,
	[doc_est_fecha_fin] [date] NULL,
	[paz_salvo_fecha_fin] [date] NULL,
	[direccion_prog_fecha_fin] [date] NULL,
	[secretaria_gen_fecha_fin] [date] NULL,
	[tipo_grado] [int] NULL,
	[estado] [bit] NOT NULL,
	[observacion] [varchar](max) NULL,
	[updated_at] [datetime] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[fecha_grado] [date] NULL,
 CONSTRAINT [PK_fechas_de_grado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[fechas_modalidades]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fechas_modalidades](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idFecha] [bigint] NOT NULL,
	[idModalidad] [int] NOT NULL,
 CONSTRAINT [PK_fechas_modalidades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[genero]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genero](
	[id] [bigint] IDENTITY(4,1) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_genero_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hoja_discapacidades]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoja_discapacidades](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idHoja] [bigint] NOT NULL,
	[idDiscapacidad] [bigint] NOT NULL,
 CONSTRAINT [PK_hoja_discapacidades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hojadevida_idiomas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hojadevida_idiomas](
	[idHoja] [bigint] NOT NULL,
	[idIdioma] [bigint] NOT NULL,
	[lectura] [bigint] NOT NULL,
	[escritura] [bigint] NOT NULL,
	[habla] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hojavida]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hojavida](
	[id] [bigint] IDENTITY(7,1) NOT NULL,
	[idPersona] [bigint] NOT NULL,
	[perfil] [nvarchar](max) NOT NULL,
	[activa] [bit] NULL,
	[laborando] [bit] NOT NULL,
 CONSTRAINT [PK_hojavida_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[idiomas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idiomas](
	[id] [bigint] IDENTITY(3,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_idiomas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[jornadas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jornadas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_jornadas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[modalidad_evaluacion]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modalidad_evaluacion](
	[id] [bigint] IDENTITY(13,1) NOT NULL,
	[idModalidad] [bigint] NOT NULL,
	[idEvaluacion] [bigint] NOT NULL,
 CONSTRAINT [PK_modalidad_evaluacion_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[modalidades]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modalidades](
	[id] [bigint] IDENTITY(8,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_modalidades_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[modalidades_estudio]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[modalidades_estudio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[abrv] [varchar](15) NULL,
 CONSTRAINT [PK_modalidades_estudio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[municipios]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[municipios](
	[id] [bigint] IDENTITY(31,1) NOT NULL,
	[idDepartamento] [bigint] NOT NULL,
	[nombre] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_municipios_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nivel_estudio]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nivel_estudio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_nivel_estudio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[niveles_cargo]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[niveles_cargo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NULL,
 CONSTRAINT [PK_niveles_cargo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[niveles_idiomas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[niveles_idiomas](
	[id] [bigint] IDENTITY(6,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_niveles_idiomas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[noticias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noticias](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](255) NOT NULL,
	[contenido] [nvarchar](max) NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_noticias_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[novedades]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[novedades](
	[id] [bigint] IDENTITY(23,1) NOT NULL,
	[idUsuario] [bigint] NULL,
	[asunto] [nvarchar](255) NOT NULL,
	[contenido] [nvarchar](max) NOT NULL,
	[fecha] [datetime2](0) NOT NULL,
	[idRespuesta] [bigint] NULL,
	[activa] [smallint] NOT NULL,
	[nombres] [varchar](500) NULL,
	[apellidos] [varchar](500) NULL,
	[tipo_identificacion] [varchar](10) NULL,
	[identificacion] [varchar](20) NULL,
	[correo] [varchar](max) NULL,
	[celular] [varchar](50) NULL,
 CONSTRAINT [PK_novedades_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ofertas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ofertas](
	[id] [bigint] IDENTITY(23,1) NOT NULL,
	[idTipo] [bigint] NOT NULL,
	[idJefe] [bigint] NULL,
	[nombre] [nvarchar](150) NOT NULL,
	[vacantes] [int] NOT NULL,
	[salario] [nvarchar](255) NULL,
	[salud] [smallint] NULL,
	[arl] [smallint] NULL,
	[estado] [bigint] NOT NULL,
	[perfil] [nvarchar](max) NOT NULL,
	[funciones] [nvarchar](max) NOT NULL,
	[observaciones] [nvarchar](max) NULL,
	[idSede] [bigint] NOT NULL,
	[fechaCierre] [date] NOT NULL,
	[idSalario] [bigint] NULL,
	[idContrato] [bigint] NULL,
	[herramientasInformaticas] [nvarchar](max) NULL,
	[experiencia] [nvarchar](255) NULL,
	[creada_por_dipro] [smallint] NOT NULL,
	[carta] [nvarchar](255) NULL,
	[idMunicipio] [bigint] NULL,
	[idExperiencia] [int] NULL,
	[mensaje_estado] [nvarchar](max) NULL,
 CONSTRAINT [PK_ofertas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ofertas_programas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ofertas_programas](
	[id] [bigint] IDENTITY(89,1) NOT NULL,
	[idOferta] [bigint] NOT NULL,
	[idDependencia] [bigint] NOT NULL,
 CONSTRAINT [PK_ofertas_programas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[paises]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[id] [bigint] IDENTITY(196,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_paises_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[parentesco]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parentesco](
	[id] [bigint] IDENTITY(8,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_parentesco_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[paz_salvos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paz_salvos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDependencia] [bigint] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_paz_salvos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[periodos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periodos](
	[id] [bigint] IDENTITY(10,1) NOT NULL,
	[nombre] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_periodos_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[persona_tipocorreos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona_tipocorreos](
	[idTipocorreo] [int] NOT NULL,
	[idPersona] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[personas](
	[id] [bigint] IDENTITY(37,1) NOT NULL,
	[nombres] [nvarchar](100) NOT NULL,
	[apellidos] [nvarchar](150) NOT NULL,
	[correo] [nvarchar](150) NOT NULL,
	[correo2] [nvarchar](150) NULL,
	[celular] [nvarchar](50) NULL,
	[celular2] [nvarchar](50) NULL,
	[telefono_fijo] [nvarchar](50) NULL,
	[identificacion] [nvarchar](100) NOT NULL,
	[ciudadExpedicion] [nvarchar](255) NULL,
	[ciudadResidencia] [bigint] NULL,
	[ciudadOrigen] [bigint] NULL,
	[fechaNacimiento] [date] NULL,
	[direccion] [nvarchar](max) NULL,
	[sector] [nvarchar](max) NULL,
	[estrato] [varchar](50) NULL,
	[idGenero] [bigint] NULL,
	[idEstadoCivil] [bigint] NULL,
	[idTipoDoc] [bigint] NULL,
	[graduado_sil] [bit] NULL,
	[tipodoc] [int] NULL,
	[lugar_expedicion] [nvarchar](200) NULL,
	[fecha_expedicion] [date] NULL,
	[recibir_mails] [bit] NULL,
	[recibir_mails_sieg] [bit] NULL,
	[estadovida] [bit] NULL,
	[etnia] [nvarchar](200) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_personas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[posibles_respuestas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posibles_respuestas](
	[id] [bigint] IDENTITY(32,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_posibles_respuestas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[postulados]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postulados](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idPersona] [bigint] NOT NULL,
	[idOferta] [bigint] NOT NULL,
	[idEstatoEmpresa] [bigint] NOT NULL,
	[idEstadoEstudiante] [bigint] NOT NULL,
	[observaciones] [nvarchar](255) NULL,
 CONSTRAINT [PK_postulados_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[practicas_tutores]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[practicas_tutores](
	[id] [bigint] IDENTITY(8,1) NOT NULL,
	[idPracticas] [bigint] NOT NULL,
	[idTutor] [bigint] NOT NULL,
	[activo] [smallint] NOT NULL,
 CONSTRAINT [PK_practicas_tutores_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pregunta_respuesta]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pregunta_respuesta](
	[id] [bigint] IDENTITY(86,1) NOT NULL,
	[idPregunta] [bigint] NOT NULL,
	[idRespuesta] [bigint] NOT NULL,
	[estado] [smallint] NOT NULL,
 CONSTRAINT [PK_pregunta_respuesta_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[preguntas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preguntas](
	[id] [bigint] IDENTITY(67,1) NOT NULL,
	[idSeccion] [bigint] NOT NULL,
	[idTipoPregunta] [bigint] NOT NULL,
	[enunciado] [nvarchar](255) NOT NULL,
	[minimo] [bigint] NULL,
	[maximo] [bigint] NULL,
	[estado] [smallint] NOT NULL,
 CONSTRAINT [PK_preguntas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[proceso_grado]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proceso_grado](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idEstudiante] [bigint] NOT NULL,
	[idFecha] [bigint] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[estado_ficha] [bit] NOT NULL,
	[fecha_ficha] [datetime] NULL,
	[estado_encuesta] [bit] NOT NULL,
	[fecha_encuesta] [datetime] NULL,
	[url_cedula] [varchar](500) NULL,
	[fecha_cedula] [datetime] NULL,
	[url_recibo] [varchar](500) NULL,
	[fecha_recibo] [datetime] NULL,
	[url_ecaes] [varchar](500) NULL,
	[fecha_ecaes] [datetime] NULL,
	[estado_secretaria] [bit] NOT NULL,
	[comentario_secretaria] [varchar](max) NULL,
	[fecha_secretaria] [datetime] NULL,
	[url_doc_programa] [varchar](500) NULL,
	[fecha_doc_programa] [datetime] NULL,
	[estado_programa] [bit] NOT NULL,
	[fecha_programa] [datetime] NULL,
	[titulo_memoria_grado] [varchar](500) NULL,
	[codigo_ecaes] [varchar](500) NULL,
	[tamano_birrete] [varchar](15) NULL,
	[estatura] [varchar](15) NULL,
	[talla_camisa] [varchar](15) NULL,
	[num_acompaniantes] [varchar](15) NULL,
	[confirmacion_asistencia] [bit] NULL,
 CONSTRAINT [PK_proceso_grado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[referencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[referencias](
	[id] [bigint] IDENTITY(14,1) NOT NULL,
	[idHoja] [bigint] NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[ocupacion] [nvarchar](255) NOT NULL,
	[telefono] [nvarchar](50) NOT NULL,
	[parentesco] [bigint] NULL,
 CONSTRAINT [PK_referencias_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[responde]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[responde](
	[id] [bigint] IDENTITY(36,1) NOT NULL,
	[idRespuesta] [bigint] NULL,
	[respuestaLibre] [nvarchar](max) NULL,
	[respuestaCuantitativa] [bigint] NULL,
	[respuestaBooleana] [smallint] NULL,
	[idUsuario] [bigint] NOT NULL,
	[idEvaluado] [bigint] NULL,
	[idPregunta] [bigint] NULL,
 CONSTRAINT [PK_responde_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(12,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[home] [varchar](50) NULL,
	[home_egresados] [varchar](50) NULL,
 CONSTRAINT [PK_roles_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[salarios]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salarios](
	[id] [bigint] IDENTITY(15,1) NOT NULL,
	[rango] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_salarios_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[secciones]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secciones](
	[id] [bigint] IDENTITY(28,1) NOT NULL,
	[idEvaluacion] [bigint] NULL,
	[idPadre] [bigint] NULL,
	[enunciado] [nvarchar](255) NULL,
	[estado] [smallint] NOT NULL,
 CONSTRAINT [PK_secciones_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sedes]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sedes](
	[id] [bigint] IDENTITY(9,1) NOT NULL,
	[idEmpresa] [bigint] NOT NULL,
	[idMunicipio] [bigint] NOT NULL,
	[direccion] [nvarchar](200) NOT NULL,
	[idTipoSede] [bigint] NOT NULL,
	[telefono] [nvarchar](20) NULL,
	[correo] [nvarchar](255) NULL,
 CONSTRAINT [PK_sedes_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipo_contactos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_contactos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_contactos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_documentos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_documentos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[abrv] [varchar](5) NULL,
 CONSTRAINT [PK_tipo_documentos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_pregunta]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_pregunta](
	[id] [bigint] IDENTITY(6,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tipo_pregunta_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipocorreos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipocorreos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipocorreos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipodependencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipodependencias](
	[id] [bigint] IDENTITY(3,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tipodependencias_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipoempleador]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoempleador](
	[id] [bigint] IDENTITY(12,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tipoempleador_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipoestudiantes]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoestudiantes](
	[id] [bigint] IDENTITY(8,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tipoestudiantes_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tiponit]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiponit](
	[id] [bigint] IDENTITY(3,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tiponit_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipoofertas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoofertas](
	[id] [bigint] IDENTITY(3,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tipoofertas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipos_de_grados]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipos_de_grados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipos_de_grados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipos_vinculacion]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipos_vinculacion](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
 CONSTRAINT [PK_tipos_vinculacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tiposedes]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposedes](
	[id] [bigint] IDENTITY(3,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tiposedes_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario_novedad]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_novedad](
	[id] [bigint] IDENTITY(27,1) NOT NULL,
	[idUsuario] [bigint] NOT NULL,
	[idNovedad] [bigint] NOT NULL,
	[leida] [smallint] NOT NULL,
 CONSTRAINT [PK_usuario_novedad_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [bigint] IDENTITY(34,1) NOT NULL,
	[idPersona] [bigint] NOT NULL,
	[idRol] [bigint] NOT NULL,
	[idSede] [bigint] NULL,
	[password] [nvarchar](60) NOT NULL,
	[area] [nvarchar](300) NULL,
	[cargo] [nvarchar](255) NULL,
	[remember_token] [nvarchar](1000) NULL,
	[identificacion] [nvarchar](255) NOT NULL,
	[activo] [smallint] NOT NULL,
	[codigo_verificacion] [varchar](5) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[ultima_actividad] [datetime] NULL,
 CONSTRAINT [PK_usuarios_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[visitas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitas](
	[id] [bigint] IDENTITY(11,1) NOT NULL,
	[idPractica] [bigint] NOT NULL,
	[fecha_registro] [datetime2](0) NOT NULL,
	[tema] [nvarchar](max) NOT NULL,
	[firma_estudiante] [smallint] NULL,
	[firma_jefe] [smallint] NULL,
	[firma_tutor] [smallint] NULL,
	[fecha] [date] NOT NULL,
	[hora] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_visitas_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [FK_acta_renovacion]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_acta_renovacion] ON [dbo].[acta_renovacion]
(
	[idConvenio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_archivos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_archivos] ON [dbo].[archivos]
(
	[idNoticia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_archivos2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_archivos2] ON [dbo].[archivos]
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Asistencias_confPeriodos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Asistencias_confPeriodos] ON [dbo].[asistencias]
(
	[idConferenciaPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_estudiantes_asistencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_estudiantes_asistencias] ON [dbo].[asistencias]
(
	[idEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_cartas_prensentacion]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_cartas_prensentacion] ON [dbo].[cartas_prensentacion]
(
	[idEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_cartas_prensentacion2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_cartas_prensentacion2] ON [dbo].[cartas_prensentacion]
(
	[estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_cartas_prensentacion3]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_cartas_prensentacion3] ON [dbo].[cartas_prensentacion]
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_competencias_hojadevida]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_competencias_hojadevida] ON [dbo].[competencias_hojadevida]
(
	[idHoja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_competencias_hojadevida2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_competencias_hojadevida2] ON [dbo].[competencias_hojadevida]
(
	[idCompetencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_ConferenciaPrograma]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_ConferenciaPrograma] ON [dbo].[conferenciaprograma]
(
	[idConferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_ConferenciaPrograma_]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_ConferenciaPrograma_] ON [dbo].[conferenciaprograma]
(
	[idPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_conferencias_periodos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_conferencias_periodos] ON [dbo].[conferencias_periodos]
(
	[orador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_conferencias_periodos_conferencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_conferencias_periodos_conferencias] ON [dbo].[conferencias_periodos]
(
	[idConferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_conferencias_periodos_periodos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_conferencias_periodos_periodos] ON [dbo].[conferencias_periodos]
(
	[idPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_convenios]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_convenios] ON [dbo].[convenios]
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_convenios2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_convenios2] ON [dbo].[convenios]
(
	[estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_coordinador_programas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_coordinador_programas] ON [dbo].[coordinador_programas]
(
	[idPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_coordinador_programas2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_coordinador_programas2] ON [dbo].[coordinador_programas]
(
	[idCoordinador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Departamentos_pais]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Departamentos_pais] ON [dbo].[departamentos]
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_dependencias_tiposdependencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_dependencias_tiposdependencias] ON [dbo].[dependencias]
(
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_empresas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_empresas] ON [dbo].[empresas]
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_empresas_actividadeconomica]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_empresas_actividadeconomica] ON [dbo].[empresas]
(
	[idActividadEconomica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_empresas_empleador]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_empresas_empleador] ON [dbo].[empresas]
(
	[idTipoEmpleador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_empresas_estadoDipro]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_empresas_estadoDipro] ON [dbo].[empresas]
(
	[estadoDipro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_empresas_estadoSil]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_empresas_estadoSil] ON [dbo].[empresas]
(
	[estadoSil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_empresas_tipoNit]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_empresas_tipoNit] ON [dbo].[empresas]
(
	[idTipoNit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_estudiantes]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_estudiantes] ON [dbo].[estudiantes]
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_estudiantes_dependencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_estudiantes_dependencias] ON [dbo].[estudiantes]
(
	[idPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Estudiantes_Tipos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Estudiantes_Tipos] ON [dbo].[estudiantes]
(
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_estudiantes_modalidades]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_estudiantes_modalidades] ON [dbo].[estudiantes_modalidades]
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_estudiantes_modalidades_estado]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_estudiantes_modalidades_estado] ON [dbo].[estudiantes_modalidades]
(
	[estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_estudiantes_modalidades1]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_estudiantes_modalidades1] ON [dbo].[estudiantes_modalidades]
(
	[idEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_estudiantes_modalidades2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_estudiantes_modalidades2] ON [dbo].[estudiantes_modalidades]
(
	[idModalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Estudios_Hoja]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Estudios_Hoja] ON [dbo].[estudiosrealizados]
(
	[idHoja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Estudios_Municipios]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Estudios_Municipios] ON [dbo].[estudiosrealizados]
(
	[idMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_evaluaciones]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_evaluaciones] ON [dbo].[evaluaciones]
(
	[idRolevaluador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_evaluaciones2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_evaluaciones2] ON [dbo].[evaluaciones]
(
	[idRolevaluado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_experiencias_laborales_hojadevida]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_experiencias_laborales_hojadevida] ON [dbo].[experiencias_laborales]
(
	[idHoja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_hojadevida_idiomas_escritura]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_hojadevida_idiomas_escritura] ON [dbo].[hojadevida_idiomas]
(
	[escritura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_hojadevida_idiomas_habla]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_hojadevida_idiomas_habla] ON [dbo].[hojadevida_idiomas]
(
	[habla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_hojadevida_idiomas_hojadevida]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_hojadevida_idiomas_hojadevida] ON [dbo].[hojadevida_idiomas]
(
	[idHoja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_hojadevida_idiomas_idiomas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_hojadevida_idiomas_idiomas] ON [dbo].[hojadevida_idiomas]
(
	[idIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_hojadevida_idiomas_lectura]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_hojadevida_idiomas_lectura] ON [dbo].[hojadevida_idiomas]
(
	[lectura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_HojaVida]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_HojaVida] ON [dbo].[hojavida]
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_modalidad_evaluacion]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_modalidad_evaluacion] ON [dbo].[modalidad_evaluacion]
(
	[idModalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_modalidad_evaluacion2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_modalidad_evaluacion2] ON [dbo].[modalidad_evaluacion]
(
	[idEvaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_municipios_departamento]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_municipios_departamento] ON [dbo].[municipios]
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Novedades_usuarios]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Novedades_usuarios] ON [dbo].[novedades]
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Ofertas_Contratos]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Ofertas_Contratos] ON [dbo].[ofertas]
(
	[idContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Ofertas_Estado]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Ofertas_Estado] ON [dbo].[ofertas]
(
	[estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_ofertas_salarios]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_ofertas_salarios] ON [dbo].[ofertas]
(
	[idSalario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Ofertas_sede]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Ofertas_sede] ON [dbo].[ofertas]
(
	[idSede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_ofertas_tipoofertas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_ofertas_tipoofertas] ON [dbo].[ofertas]
(
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Ofertas_usuario]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Ofertas_usuario] ON [dbo].[ofertas]
(
	[idJefe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Ofertas_programas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Ofertas_programas] ON [dbo].[ofertas_programas]
(
	[idOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Ofertas_programas_dependencias]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Ofertas_programas_dependencias] ON [dbo].[ofertas_programas]
(
	[idDependencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_personas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_personas] ON [dbo].[personas]
(
	[idTipoDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Personas_EstadoCivil]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Personas_EstadoCivil] ON [dbo].[personas]
(
	[idEstadoCivil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Personas_Genero]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Personas_Genero] ON [dbo].[personas]
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_personas_municipios]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_personas_municipios] ON [dbo].[personas]
(
	[ciudadOrigen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Postulados]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Postulados] ON [dbo].[postulados]
(
	[idOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Postulados_estadoEmpresa]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Postulados_estadoEmpresa] ON [dbo].[postulados]
(
	[idEstatoEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Postulados_estudianteAprobacion]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Postulados_estudianteAprobacion] ON [dbo].[postulados]
(
	[idEstadoEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Postulados_estudiantes]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Postulados_estudiantes] ON [dbo].[postulados]
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_practicas_tutores]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_practicas_tutores] ON [dbo].[practicas_tutores]
(
	[idPracticas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_practicas_tutores2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_practicas_tutores2] ON [dbo].[practicas_tutores]
(
	[idTutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_pregunta_respuesta]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_pregunta_respuesta] ON [dbo].[pregunta_respuesta]
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_pregunta_respuesta2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_pregunta_respuesta2] ON [dbo].[pregunta_respuesta]
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_preguntas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_preguntas] ON [dbo].[preguntas]
(
	[idSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_preguntas2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_preguntas2] ON [dbo].[preguntas]
(
	[idTipoPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_referencias_hojadevida]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_referencias_hojadevida] ON [dbo].[referencias]
(
	[idHoja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Referencias_Parentesco]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Referencias_Parentesco] ON [dbo].[referencias]
(
	[parentesco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Responde]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Responde] ON [dbo].[responde]
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Responde2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Responde2] ON [dbo].[responde]
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Responde3]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Responde3] ON [dbo].[responde]
(
	[idEvaluado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Responde4]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Responde4] ON [dbo].[responde]
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_secciones]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_secciones] ON [dbo].[secciones]
(
	[idPadre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_secciones2]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_secciones2] ON [dbo].[secciones]
(
	[idEvaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Sede_empresa]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Sede_empresa] ON [dbo].[sedes]
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Sede_municipio]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_Sede_municipio] ON [dbo].[sedes]
(
	[idMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_sedes_tiposedes]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_sedes_tiposedes] ON [dbo].[sedes]
(
	[idTipoSede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_usuario_novedad]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_usuario_novedad] ON [dbo].[usuario_novedad]
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_usuario_novedad_novedad]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_usuario_novedad_novedad] ON [dbo].[usuario_novedad]
(
	[idNovedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_personas_usuarios]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_personas_usuarios] ON [dbo].[usuarios]
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_usuarios_roles]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_usuarios_roles] ON [dbo].[usuarios]
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_usuarios_sedes]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_usuarios_sedes] ON [dbo].[usuarios]
(
	[idSede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_visitas]    Script Date: 12/02/2019 9:30:50 a. m. ******/
CREATE NONCLUSTERED INDEX [FK_visitas] ON [dbo].[visitas]
(
	[idPractica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[archivos] ADD  DEFAULT (NULL) FOR [idNoticia]
GO
ALTER TABLE [dbo].[archivos] ADD  DEFAULT (NULL) FOR [titulo]
GO
ALTER TABLE [dbo].[archivos] ADD  DEFAULT (NULL) FOR [estado]
GO
ALTER TABLE [dbo].[asistencias] ADD  DEFAULT (NULL) FOR [asistio]
GO
ALTER TABLE [dbo].[cartas_prensentacion] ADD  DEFAULT (NULL) FOR [radicado]
GO
ALTER TABLE [dbo].[cartas_prensentacion] ADD  DEFAULT (NULL) FOR [anio]
GO
ALTER TABLE [dbo].[cartas_prensentacion] ADD  DEFAULT (NULL) FOR [periodo]
GO
ALTER TABLE [dbo].[cartas_prensentacion] ADD  DEFAULT (NULL) FOR [fecha]
GO
ALTER TABLE [dbo].[cartas_prensentacion] ADD  DEFAULT (NULL) FOR [codigo_verificacion]
GO
ALTER TABLE [dbo].[conferencia] ADD  DEFAULT (NULL) FOR [valoracion]
GO
ALTER TABLE [dbo].[conferencias_periodos] ADD  DEFAULT (NULL) FOR [valoracion]
GO
ALTER TABLE [dbo].[convenios] ADD  DEFAULT (NULL) FOR [fecha_inicio]
GO
ALTER TABLE [dbo].[convenios] ADD  DEFAULT (NULL) FOR [fecha_fin]
GO
ALTER TABLE [dbo].[convenios] ADD  DEFAULT (NULL) FOR [minuta]
GO
ALTER TABLE [dbo].[convenios] ADD  DEFAULT (NULL) FOR [convenio]
GO
ALTER TABLE [dbo].[dependencias] ADD  DEFAULT (NULL) FOR [codigoPrograma]
GO
ALTER TABLE [dbo].[dependencias] ADD  DEFAULT (NULL) FOR [codigoPracticas]
GO
ALTER TABLE [dbo].[empresas] ADD  CONSTRAINT [DF__empresas__estado__44CA3770]  DEFAULT (NULL) FOR [estadoDipro]
GO
ALTER TABLE [dbo].[empresas] ADD  CONSTRAINT [DF__empresas__estado__45BE5BA9]  DEFAULT (NULL) FOR [estadoSil]
GO
ALTER TABLE [dbo].[empresas] ADD  CONSTRAINT [DF__empresas__pagina__46B27FE2]  DEFAULT (NULL) FOR [paginaWeb]
GO
ALTER TABLE [dbo].[est_pazsalvo] ADD  CONSTRAINT [DF_est_pazsalvo_paz_salvo]  DEFAULT ((0)) FOR [paz_salvo]
GO
ALTER TABLE [dbo].[estudiantes] ADD  CONSTRAINT [DF__estudiant__prome__47A6A41B]  DEFAULT (NULL) FOR [promedio]
GO
ALTER TABLE [dbo].[estudiantes] ADD  CONSTRAINT [DF__estudiant__aprob__489AC854]  DEFAULT (NULL) FOR [aprobo_prepracticas]
GO
ALTER TABLE [dbo].[estudiantes] ADD  CONSTRAINT [DF__estudiant__perio__498EEC8D]  DEFAULT (NULL) FOR [periodo_prepracticas]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [idEstudiante]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [idModalidad]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [fecha_inicio]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [fecha_fin]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [periodo]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [nombre_arl]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [certificado_arl]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [certificado_salud]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [aprobacion_estudiante]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [fecha_aprobacion_estudiante]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT ((0)) FOR [aprobacion_jefe]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [fecha_aprobacion_jefe]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT ((0)) FOR [aprobacion_dippro]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [fecha_aprobacion_dippro]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [estado]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_carta_solicitud]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_certificado_laboral]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_existencia_empresa]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_afiliacion_ss]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_contrato]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_carta_colaboracion]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_cedula_relegal]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_carta_director_programa]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_formato_movilidad]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_pasaporte]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_visa]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_cedula]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_carnet]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_padres]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_estudiante]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_itinerario]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [file_seguro]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [proyecto_impacto]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [estado_ori]
GO
ALTER TABLE [dbo].[estudiantes_modalidades] ADD  DEFAULT (NULL) FOR [idCiudad]
GO
ALTER TABLE [dbo].[evaluaciones] ADD  DEFAULT (NULL) FOR [idRolevaluado]
GO
ALTER TABLE [dbo].[evaluaciones] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[hojavida] ADD  CONSTRAINT [DF_hojavida_laborando]  DEFAULT ((0)) FOR [laborando]
GO
ALTER TABLE [dbo].[novedades] ADD  DEFAULT (NULL) FOR [idRespuesta]
GO
ALTER TABLE [dbo].[novedades] ADD  DEFAULT ((1)) FOR [activa]
GO
ALTER TABLE [dbo].[ofertas] ADD  DEFAULT (NULL) FOR [idJefe]
GO
ALTER TABLE [dbo].[ofertas] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[ofertas] ADD  DEFAULT (NULL) FOR [idSalario]
GO
ALTER TABLE [dbo].[ofertas] ADD  DEFAULT (NULL) FOR [idContrato]
GO
ALTER TABLE [dbo].[ofertas] ADD  DEFAULT (NULL) FOR [experiencia]
GO
ALTER TABLE [dbo].[ofertas] ADD  DEFAULT ((0)) FOR [creada_por_dipro]
GO
ALTER TABLE [dbo].[ofertas] ADD  DEFAULT (NULL) FOR [carta]
GO
ALTER TABLE [dbo].[personas] ADD  CONSTRAINT [DF__personas__celula__76619304]  DEFAULT (NULL) FOR [celular]
GO
ALTER TABLE [dbo].[personas] ADD  CONSTRAINT [DF__personas__ciudad__7755B73D]  DEFAULT (NULL) FOR [ciudadExpedicion]
GO
ALTER TABLE [dbo].[personas] ADD  CONSTRAINT [DF__personas__ciudad__7849DB76]  DEFAULT (NULL) FOR [ciudadOrigen]
GO
ALTER TABLE [dbo].[personas] ADD  CONSTRAINT [DF__personas__fechaN__793DFFAF]  DEFAULT (NULL) FOR [fechaNacimiento]
GO
ALTER TABLE [dbo].[personas] ADD  CONSTRAINT [DF__personas__idGene__7A3223E8]  DEFAULT (NULL) FOR [idGenero]
GO
ALTER TABLE [dbo].[personas] ADD  CONSTRAINT [DF__personas__idEsta__7B264821]  DEFAULT (NULL) FOR [idEstadoCivil]
GO
ALTER TABLE [dbo].[personas] ADD  CONSTRAINT [DF__personas__idTipo__7C1A6C5A]  DEFAULT (NULL) FOR [idTipoDoc]
GO
ALTER TABLE [dbo].[postulados] ADD  CONSTRAINT [DF__postulado__obser__7D0E9093]  DEFAULT (NULL) FOR [observaciones]
GO
ALTER TABLE [dbo].[pregunta_respuesta] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[preguntas] ADD  DEFAULT (NULL) FOR [minimo]
GO
ALTER TABLE [dbo].[preguntas] ADD  DEFAULT (NULL) FOR [maximo]
GO
ALTER TABLE [dbo].[preguntas] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[referencias] ADD  DEFAULT (NULL) FOR [parentesco]
GO
ALTER TABLE [dbo].[responde] ADD  DEFAULT (NULL) FOR [idRespuesta]
GO
ALTER TABLE [dbo].[responde] ADD  DEFAULT (NULL) FOR [respuestaCuantitativa]
GO
ALTER TABLE [dbo].[responde] ADD  DEFAULT (NULL) FOR [respuestaBooleana]
GO
ALTER TABLE [dbo].[responde] ADD  DEFAULT (NULL) FOR [idEvaluado]
GO
ALTER TABLE [dbo].[responde] ADD  DEFAULT (NULL) FOR [idPregunta]
GO
ALTER TABLE [dbo].[secciones] ADD  DEFAULT (NULL) FOR [idEvaluacion]
GO
ALTER TABLE [dbo].[secciones] ADD  DEFAULT (NULL) FOR [idPadre]
GO
ALTER TABLE [dbo].[secciones] ADD  DEFAULT (NULL) FOR [enunciado]
GO
ALTER TABLE [dbo].[secciones] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[sedes] ADD  DEFAULT (NULL) FOR [telefono]
GO
ALTER TABLE [dbo].[sedes] ADD  DEFAULT (NULL) FOR [correo]
GO
ALTER TABLE [dbo].[usuario_novedad] ADD  DEFAULT ((0)) FOR [leida]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (NULL) FOR [idSede]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (NULL) FOR [area]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (NULL) FOR [cargo]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (NULL) FOR [remember_token]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((0)) FOR [activo]
GO
ALTER TABLE [dbo].[visitas] ADD  DEFAULT (NULL) FOR [firma_estudiante]
GO
ALTER TABLE [dbo].[visitas] ADD  DEFAULT (NULL) FOR [firma_jefe]
GO
ALTER TABLE [dbo].[visitas] ADD  DEFAULT (NULL) FOR [firma_tutor]
GO
ALTER TABLE [dbo].[acta_renovacion]  WITH NOCHECK ADD  CONSTRAINT [acta_renovacion$FK_acta_renovacion] FOREIGN KEY([idConvenio])
REFERENCES [dbo].[convenios] ([id])
GO
ALTER TABLE [dbo].[acta_renovacion] CHECK CONSTRAINT [acta_renovacion$FK_acta_renovacion]
GO
ALTER TABLE [dbo].[anuncios_dependencias]  WITH CHECK ADD  CONSTRAINT [FK_anuncios_dependencias_anuncios] FOREIGN KEY([idAnuncio])
REFERENCES [dbo].[anuncios] ([id])
GO
ALTER TABLE [dbo].[anuncios_dependencias] CHECK CONSTRAINT [FK_anuncios_dependencias_anuncios]
GO
ALTER TABLE [dbo].[anuncios_dependencias]  WITH CHECK ADD  CONSTRAINT [FK_anuncios_dependencias_dependencias] FOREIGN KEY([idPrograma])
REFERENCES [dbo].[dependencias] ([id])
GO
ALTER TABLE [dbo].[anuncios_dependencias] CHECK CONSTRAINT [FK_anuncios_dependencias_dependencias]
GO
ALTER TABLE [dbo].[archivos]  WITH NOCHECK ADD  CONSTRAINT [archivos$FK_archivos] FOREIGN KEY([idNoticia])
REFERENCES [dbo].[noticias] ([id])
GO
ALTER TABLE [dbo].[archivos] CHECK CONSTRAINT [archivos$FK_archivos]
GO
ALTER TABLE [dbo].[archivos]  WITH NOCHECK ADD  CONSTRAINT [archivos$FK_archivos2] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[categorias_archivos] ([id])
GO
ALTER TABLE [dbo].[archivos] CHECK CONSTRAINT [archivos$FK_archivos2]
GO
ALTER TABLE [dbo].[asistencias]  WITH NOCHECK ADD  CONSTRAINT [asistencias$FK_Asistencias_confPeriodos] FOREIGN KEY([idConferenciaPeriodo])
REFERENCES [dbo].[conferencias_periodos] ([id])
GO
ALTER TABLE [dbo].[asistencias] CHECK CONSTRAINT [asistencias$FK_Asistencias_confPeriodos]
GO
ALTER TABLE [dbo].[asistencias]  WITH NOCHECK ADD  CONSTRAINT [asistencias$FK_estudiantes_asistencias] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[estudiantes] ([id])
GO
ALTER TABLE [dbo].[asistencias] CHECK CONSTRAINT [asistencias$FK_estudiantes_asistencias]
GO
ALTER TABLE [dbo].[asociaciones]  WITH CHECK ADD  CONSTRAINT [FK_asociaciones_hojavida] FOREIGN KEY([idHoja])
REFERENCES [dbo].[hojavida] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[asociaciones] CHECK CONSTRAINT [FK_asociaciones_hojavida]
GO
ALTER TABLE [dbo].[cartas_prensentacion]  WITH NOCHECK ADD  CONSTRAINT [cartas_prensentacion$FK_cartas_prensentacion] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[estudiantes] ([id])
GO
ALTER TABLE [dbo].[cartas_prensentacion] CHECK CONSTRAINT [cartas_prensentacion$FK_cartas_prensentacion]
GO
ALTER TABLE [dbo].[cartas_prensentacion]  WITH NOCHECK ADD  CONSTRAINT [cartas_prensentacion$FK_cartas_prensentacion2] FOREIGN KEY([estado])
REFERENCES [dbo].[estado_cartas] ([id])
GO
ALTER TABLE [dbo].[cartas_prensentacion] CHECK CONSTRAINT [cartas_prensentacion$FK_cartas_prensentacion2]
GO
ALTER TABLE [dbo].[cartas_prensentacion]  WITH NOCHECK ADD  CONSTRAINT [cartas_prensentacion$FK_cartas_prensentacion3] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[empresas] ([id])
GO
ALTER TABLE [dbo].[cartas_prensentacion] CHECK CONSTRAINT [cartas_prensentacion$FK_cartas_prensentacion3]
GO
ALTER TABLE [dbo].[competencias_hojadevida]  WITH NOCHECK ADD  CONSTRAINT [competencias_hojadevida$FK_competencias_hojadevida] FOREIGN KEY([idHoja])
REFERENCES [dbo].[hojavida] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[competencias_hojadevida] CHECK CONSTRAINT [competencias_hojadevida$FK_competencias_hojadevida]
GO
ALTER TABLE [dbo].[competencias_hojadevida]  WITH NOCHECK ADD  CONSTRAINT [competencias_hojadevida$FK_competencias_hojadevida2] FOREIGN KEY([idCompetencia])
REFERENCES [dbo].[competencias] ([id])
GO
ALTER TABLE [dbo].[competencias_hojadevida] CHECK CONSTRAINT [competencias_hojadevida$FK_competencias_hojadevida2]
GO
ALTER TABLE [dbo].[concejos_profesionales]  WITH CHECK ADD  CONSTRAINT [FK_concejos_profesionales_hojavida] FOREIGN KEY([idHoja])
REFERENCES [dbo].[hojavida] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[concejos_profesionales] CHECK CONSTRAINT [FK_concejos_profesionales_hojavida]
GO
ALTER TABLE [dbo].[conferenciaprograma]  WITH NOCHECK ADD  CONSTRAINT [conferenciaprograma$FK_ConferenciaPrograma] FOREIGN KEY([idConferencia])
REFERENCES [dbo].[conferencia] ([id])
GO
ALTER TABLE [dbo].[conferenciaprograma] CHECK CONSTRAINT [conferenciaprograma$FK_ConferenciaPrograma]
GO
ALTER TABLE [dbo].[conferenciaprograma]  WITH NOCHECK ADD  CONSTRAINT [conferenciaprograma$FK_ConferenciaPrograma_] FOREIGN KEY([idPrograma])
REFERENCES [dbo].[dependencias] ([id])
GO
ALTER TABLE [dbo].[conferenciaprograma] CHECK CONSTRAINT [conferenciaprograma$FK_ConferenciaPrograma_]
GO
ALTER TABLE [dbo].[conferencias_periodos]  WITH NOCHECK ADD  CONSTRAINT [conferencias_periodos$FK_conferencias_periodos] FOREIGN KEY([orador])
REFERENCES [dbo].[personas] ([id])
GO
ALTER TABLE [dbo].[conferencias_periodos] CHECK CONSTRAINT [conferencias_periodos$FK_conferencias_periodos]
GO
ALTER TABLE [dbo].[conferencias_periodos]  WITH NOCHECK ADD  CONSTRAINT [conferencias_periodos$FK_conferencias_periodos_conferencias] FOREIGN KEY([idConferencia])
REFERENCES [dbo].[conferencia] ([id])
GO
ALTER TABLE [dbo].[conferencias_periodos] CHECK CONSTRAINT [conferencias_periodos$FK_conferencias_periodos_conferencias]
GO
ALTER TABLE [dbo].[conferencias_periodos]  WITH NOCHECK ADD  CONSTRAINT [conferencias_periodos$FK_conferencias_periodos_periodos] FOREIGN KEY([idPeriodo])
REFERENCES [dbo].[periodos] ([id])
GO
ALTER TABLE [dbo].[conferencias_periodos] CHECK CONSTRAINT [conferencias_periodos$FK_conferencias_periodos_periodos]
GO
ALTER TABLE [dbo].[contactos]  WITH CHECK ADD  CONSTRAINT [FK_contactos_tipo_contactos] FOREIGN KEY([idTipo])
REFERENCES [dbo].[tipo_contactos] ([id])
GO
ALTER TABLE [dbo].[contactos] CHECK CONSTRAINT [FK_contactos_tipo_contactos]
GO
ALTER TABLE [dbo].[convenios]  WITH NOCHECK ADD  CONSTRAINT [convenios$FK_convenios] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[empresas] ([id])
GO
ALTER TABLE [dbo].[convenios] CHECK CONSTRAINT [convenios$FK_convenios]
GO
ALTER TABLE [dbo].[convenios]  WITH NOCHECK ADD  CONSTRAINT [convenios$FK_convenios2] FOREIGN KEY([estado])
REFERENCES [dbo].[estado_convenio] ([id])
GO
ALTER TABLE [dbo].[convenios] CHECK CONSTRAINT [convenios$FK_convenios2]
GO
ALTER TABLE [dbo].[coordinador_programas]  WITH NOCHECK ADD  CONSTRAINT [coordinador_programas$FK_coordinador_programas2] FOREIGN KEY([idCoordinador])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[coordinador_programas] CHECK CONSTRAINT [coordinador_programas$FK_coordinador_programas2]
GO
ALTER TABLE [dbo].[coordinador_programas]  WITH CHECK ADD  CONSTRAINT [FK_coordinador_programas_dependencias_modalidades] FOREIGN KEY([idPrograma])
REFERENCES [dbo].[dependencias_modalidades] ([id])
GO
ALTER TABLE [dbo].[coordinador_programas] CHECK CONSTRAINT [FK_coordinador_programas_dependencias_modalidades]
GO
ALTER TABLE [dbo].[departamentos]  WITH NOCHECK ADD  CONSTRAINT [departamentos$FK_Departamentos_pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[paises] ([id])
GO
ALTER TABLE [dbo].[departamentos] CHECK CONSTRAINT [departamentos$FK_Departamentos_pais]
GO
ALTER TABLE [dbo].[dependencias]  WITH NOCHECK ADD  CONSTRAINT [dependencias$FK_dependencias_tiposdependencias] FOREIGN KEY([idTipo])
REFERENCES [dbo].[tipodependencias] ([id])
GO
ALTER TABLE [dbo].[dependencias] CHECK CONSTRAINT [dependencias$FK_dependencias_tiposdependencias]
GO
ALTER TABLE [dbo].[dependencias]  WITH CHECK ADD  CONSTRAINT [FK_dependencias_nivel_estudio] FOREIGN KEY([idNivelestudio])
REFERENCES [dbo].[nivel_estudio] ([id])
GO
ALTER TABLE [dbo].[dependencias] CHECK CONSTRAINT [FK_dependencias_nivel_estudio]
GO
ALTER TABLE [dbo].[dependencias_modalidades]  WITH CHECK ADD  CONSTRAINT [FK_dependencias_modalidades_dependencias] FOREIGN KEY([idPrograma])
REFERENCES [dbo].[dependencias] ([id])
GO
ALTER TABLE [dbo].[dependencias_modalidades] CHECK CONSTRAINT [FK_dependencias_modalidades_dependencias]
GO
ALTER TABLE [dbo].[dependencias_modalidades]  WITH CHECK ADD  CONSTRAINT [FK_dependencias_modalidades_dependencias1] FOREIGN KEY([idFacultad])
REFERENCES [dbo].[dependencias] ([id])
GO
ALTER TABLE [dbo].[dependencias_modalidades] CHECK CONSTRAINT [FK_dependencias_modalidades_dependencias1]
GO
ALTER TABLE [dbo].[dependencias_modalidades]  WITH CHECK ADD  CONSTRAINT [FK_dependencias_modalidades_jornadas] FOREIGN KEY([idJornada])
REFERENCES [dbo].[jornadas] ([id])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[dependencias_modalidades] CHECK CONSTRAINT [FK_dependencias_modalidades_jornadas]
GO
ALTER TABLE [dbo].[dependencias_modalidades]  WITH CHECK ADD  CONSTRAINT [FK_dependencias_modalidades_modalidades_estudio] FOREIGN KEY([idModalidad])
REFERENCES [dbo].[modalidades_estudio] ([id])
GO
ALTER TABLE [dbo].[dependencias_modalidades] CHECK CONSTRAINT [FK_dependencias_modalidades_modalidades_estudio]
GO
ALTER TABLE [dbo].[distinciones]  WITH CHECK ADD  CONSTRAINT [FK_distinciones_hojavida] FOREIGN KEY([idHoja])
REFERENCES [dbo].[hojavida] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[distinciones] CHECK CONSTRAINT [FK_distinciones_hojavida]
GO
ALTER TABLE [dbo].[documentos]  WITH CHECK ADD  CONSTRAINT [FK_documentos_estudiantes] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[estudiantes] ([id])
GO
ALTER TABLE [dbo].[documentos] CHECK CONSTRAINT [FK_documentos_estudiantes]
GO
ALTER TABLE [dbo].[empresas]  WITH NOCHECK ADD  CONSTRAINT [empresas$FK_empresas] FOREIGN KEY([idPersona])
REFERENCES [dbo].[personas] ([id])
GO
ALTER TABLE [dbo].[empresas] CHECK CONSTRAINT [empresas$FK_empresas]
GO
ALTER TABLE [dbo].[empresas]  WITH NOCHECK ADD  CONSTRAINT [empresas$FK_empresas_actividadeconomica] FOREIGN KEY([idActividadEconomica])
REFERENCES [dbo].[actividades_economicas] ([id])
GO
ALTER TABLE [dbo].[empresas] CHECK CONSTRAINT [empresas$FK_empresas_actividadeconomica]
GO
ALTER TABLE [dbo].[empresas]  WITH NOCHECK ADD  CONSTRAINT [empresas$FK_empresas_empleador] FOREIGN KEY([idTipoEmpleador])
REFERENCES [dbo].[tipoempleador] ([id])
GO
ALTER TABLE [dbo].[empresas] CHECK CONSTRAINT [empresas$FK_empresas_empleador]
GO
ALTER TABLE [dbo].[empresas]  WITH NOCHECK ADD  CONSTRAINT [empresas$FK_empresas_estadoDipro] FOREIGN KEY([estadoDipro])
REFERENCES [dbo].[estadoempresas] ([id])
GO
ALTER TABLE [dbo].[empresas] CHECK CONSTRAINT [empresas$FK_empresas_estadoDipro]
GO
ALTER TABLE [dbo].[empresas]  WITH NOCHECK ADD  CONSTRAINT [empresas$FK_empresas_estadoSil] FOREIGN KEY([estadoSil])
REFERENCES [dbo].[estadoempresas] ([id])
GO
ALTER TABLE [dbo].[empresas] CHECK CONSTRAINT [empresas$FK_empresas_estadoSil]
GO
ALTER TABLE [dbo].[empresas]  WITH NOCHECK ADD  CONSTRAINT [empresas$FK_empresas_tipoNit] FOREIGN KEY([idTipoNit])
REFERENCES [dbo].[tiponit] ([id])
GO
ALTER TABLE [dbo].[empresas] CHECK CONSTRAINT [empresas$FK_empresas_tipoNit]
GO
ALTER TABLE [dbo].[empresas_hojavida]  WITH CHECK ADD  CONSTRAINT [FK_empresas_hojavida_empresas] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[empresas] ([id])
GO
ALTER TABLE [dbo].[empresas_hojavida] CHECK CONSTRAINT [FK_empresas_hojavida_empresas]
GO
ALTER TABLE [dbo].[empresas_hojavida]  WITH CHECK ADD  CONSTRAINT [FK_empresas_hojavida_hojavida] FOREIGN KEY([idHojavida])
REFERENCES [dbo].[hojavida] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[empresas_hojavida] CHECK CONSTRAINT [FK_empresas_hojavida_hojavida]
GO
ALTER TABLE [dbo].[est_pazsalvo]  WITH CHECK ADD  CONSTRAINT [FK_est_pazsalvo_estudiantes] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[estudiantes] ([id])
GO
ALTER TABLE [dbo].[est_pazsalvo] CHECK CONSTRAINT [FK_est_pazsalvo_estudiantes]
GO
ALTER TABLE [dbo].[est_pazsalvo]  WITH CHECK ADD  CONSTRAINT [FK_est_pazsalvo_paz_salvos] FOREIGN KEY([idPazsalvo])
REFERENCES [dbo].[paz_salvos] ([id])
GO
ALTER TABLE [dbo].[est_pazsalvo] CHECK CONSTRAINT [FK_est_pazsalvo_paz_salvos]
GO
ALTER TABLE [dbo].[estudiantes]  WITH NOCHECK ADD  CONSTRAINT [estudiantes$FK_estudiantes] FOREIGN KEY([idPersona])
REFERENCES [dbo].[personas] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[estudiantes] CHECK CONSTRAINT [estudiantes$FK_estudiantes]
GO
ALTER TABLE [dbo].[estudiantes]  WITH NOCHECK ADD  CONSTRAINT [estudiantes$FK_Estudiantes_Tipos] FOREIGN KEY([idTipo])
REFERENCES [dbo].[tipoestudiantes] ([id])
GO
ALTER TABLE [dbo].[estudiantes] CHECK CONSTRAINT [estudiantes$FK_Estudiantes_Tipos]
GO
ALTER TABLE [dbo].[estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_estudiantes_dependencias_modalidades] FOREIGN KEY([idPrograma])
REFERENCES [dbo].[dependencias_modalidades] ([id])
GO
ALTER TABLE [dbo].[estudiantes] CHECK CONSTRAINT [FK_estudiantes_dependencias_modalidades]
GO
ALTER TABLE [dbo].[estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_estudiantes_distinciones_estudiantes] FOREIGN KEY([distincion])
REFERENCES [dbo].[distinciones_estudiantes] ([id])
GO
ALTER TABLE [dbo].[estudiantes] CHECK CONSTRAINT [FK_estudiantes_distinciones_estudiantes]
GO
ALTER TABLE [dbo].[estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_estudiantes_municipios] FOREIGN KEY([idZonal])
REFERENCES [dbo].[municipios] ([id])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[estudiantes] CHECK CONSTRAINT [FK_estudiantes_municipios]
GO
ALTER TABLE [dbo].[estudiantes_modalidades]  WITH NOCHECK ADD  CONSTRAINT [estudiantes_modalidades$FK_estudiantes_modalidades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[municipios] ([id])
GO
ALTER TABLE [dbo].[estudiantes_modalidades] CHECK CONSTRAINT [estudiantes_modalidades$FK_estudiantes_modalidades]
GO
ALTER TABLE [dbo].[estudiantes_modalidades]  WITH NOCHECK ADD  CONSTRAINT [estudiantes_modalidades$FK_estudiantes_modalidades_estado] FOREIGN KEY([estado])
REFERENCES [dbo].[estado_practicas] ([id])
GO
ALTER TABLE [dbo].[estudiantes_modalidades] CHECK CONSTRAINT [estudiantes_modalidades$FK_estudiantes_modalidades_estado]
GO
ALTER TABLE [dbo].[estudiantes_modalidades]  WITH NOCHECK ADD  CONSTRAINT [estudiantes_modalidades$FK_estudiantes_modalidades1] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[estudiantes] ([id])
GO
ALTER TABLE [dbo].[estudiantes_modalidades] CHECK CONSTRAINT [estudiantes_modalidades$FK_estudiantes_modalidades1]
GO
ALTER TABLE [dbo].[estudiantes_modalidades]  WITH NOCHECK ADD  CONSTRAINT [estudiantes_modalidades$FK_estudiantes_modalidades2] FOREIGN KEY([idModalidad])
REFERENCES [dbo].[modalidades] ([id])
GO
ALTER TABLE [dbo].[estudiantes_modalidades] CHECK CONSTRAINT [estudiantes_modalidades$FK_estudiantes_modalidades2]
GO
ALTER TABLE [dbo].[estudiosrealizados]  WITH NOCHECK ADD  CONSTRAINT [estudiosrealizados$FK_Estudios_Hoja] FOREIGN KEY([idHoja])
REFERENCES [dbo].[hojavida] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[estudiosrealizados] CHECK CONSTRAINT [estudiosrealizados$FK_Estudios_Hoja]
GO
ALTER TABLE [dbo].[estudiosrealizados]  WITH NOCHECK ADD  CONSTRAINT [estudiosrealizados$FK_Estudios_Municipios] FOREIGN KEY([idMunicipio])
REFERENCES [dbo].[municipios] ([id])
GO
ALTER TABLE [dbo].[estudiosrealizados] CHECK CONSTRAINT [estudiosrealizados$FK_Estudios_Municipios]
GO
ALTER TABLE [dbo].[evaluaciones]  WITH NOCHECK ADD  CONSTRAINT [evaluaciones$FK_evaluaciones] FOREIGN KEY([idRolevaluador])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[evaluaciones] CHECK CONSTRAINT [evaluaciones$FK_evaluaciones]
GO
ALTER TABLE [dbo].[evaluaciones]  WITH NOCHECK ADD  CONSTRAINT [evaluaciones$FK_evaluaciones2] FOREIGN KEY([idRolevaluado])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[evaluaciones] CHECK CONSTRAINT [evaluaciones$FK_evaluaciones2]
GO
ALTER TABLE [dbo].[experiencias_laborales]  WITH NOCHECK ADD  CONSTRAINT [experiencias_laborales$FK_experiencias_laborales_hojadevida] FOREIGN KEY([idHoja])
REFERENCES [dbo].[hojavida] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[experiencias_laborales] CHECK CONSTRAINT [experiencias_laborales$FK_experiencias_laborales_hojadevida]
GO
ALTER TABLE [dbo].[experiencias_laborales]  WITH CHECK ADD  CONSTRAINT [FK_experiencias_laborales_duraciones] FOREIGN KEY([duracion])
REFERENCES [dbo].[duraciones] ([id])
GO
ALTER TABLE [dbo].[experiencias_laborales] CHECK CONSTRAINT [FK_experiencias_laborales_duraciones]
GO
ALTER TABLE [dbo].[experiencias_laborales]  WITH CHECK ADD  CONSTRAINT [FK_experiencias_laborales_municipios] FOREIGN KEY([municipio_id])
REFERENCES [dbo].[municipios] ([id])
GO
ALTER TABLE [dbo].[experiencias_laborales] CHECK CONSTRAINT [FK_experiencias_laborales_municipios]
GO
ALTER TABLE [dbo].[experiencias_laborales]  WITH CHECK ADD  CONSTRAINT [FK_experiencias_laborales_niveles_cargo] FOREIGN KEY([nivel_cargo_id])
REFERENCES [dbo].[niveles_cargo] ([id])
GO
ALTER TABLE [dbo].[experiencias_laborales] CHECK CONSTRAINT [FK_experiencias_laborales_niveles_cargo]
GO
ALTER TABLE [dbo].[experiencias_laborales]  WITH CHECK ADD  CONSTRAINT [FK_experiencias_laborales_salarios] FOREIGN KEY([salario_id])
REFERENCES [dbo].[salarios] ([id])
GO
ALTER TABLE [dbo].[experiencias_laborales] CHECK CONSTRAINT [FK_experiencias_laborales_salarios]
GO
ALTER TABLE [dbo].[experiencias_laborales]  WITH CHECK ADD  CONSTRAINT [FK_experiencias_laborales_tipos_vinculacion] FOREIGN KEY([tipo_vinculacion_id])
REFERENCES [dbo].[tipos_vinculacion] ([id])
GO
ALTER TABLE [dbo].[experiencias_laborales] CHECK CONSTRAINT [FK_experiencias_laborales_tipos_vinculacion]
GO
ALTER TABLE [dbo].[fecha_modalidad]  WITH CHECK ADD  CONSTRAINT [FK_fecha_modalidad_fechas_de_grado] FOREIGN KEY([idFecha])
REFERENCES [dbo].[fechas_de_grado] ([id])
GO
ALTER TABLE [dbo].[fecha_modalidad] CHECK CONSTRAINT [FK_fecha_modalidad_fechas_de_grado]
GO
ALTER TABLE [dbo].[fecha_modalidad]  WITH CHECK ADD  CONSTRAINT [FK_fecha_modalidad_modalidades_estudio] FOREIGN KEY([idModalidad])
REFERENCES [dbo].[modalidades_estudio] ([id])
GO
ALTER TABLE [dbo].[fecha_modalidad] CHECK CONSTRAINT [FK_fecha_modalidad_modalidades_estudio]
GO
ALTER TABLE [dbo].[fechas_de_grado]  WITH CHECK ADD  CONSTRAINT [FK_fechas_de_grado_tipos_de_grados] FOREIGN KEY([tipo_grado])
REFERENCES [dbo].[tipos_de_grados] ([id])
GO
ALTER TABLE [dbo].[fechas_de_grado] CHECK CONSTRAINT [FK_fechas_de_grado_tipos_de_grados]
GO
ALTER TABLE [dbo].[fechas_modalidades]  WITH CHECK ADD  CONSTRAINT [FK_fechas_modalidades_fechas_de_grado] FOREIGN KEY([idFecha])
REFERENCES [dbo].[fechas_de_grado] ([id])
GO
ALTER TABLE [dbo].[fechas_modalidades] CHECK CONSTRAINT [FK_fechas_modalidades_fechas_de_grado]
GO
ALTER TABLE [dbo].[fechas_modalidades]  WITH CHECK ADD  CONSTRAINT [FK_fechas_modalidades_modalidades_estudio] FOREIGN KEY([idModalidad])
REFERENCES [dbo].[modalidades_estudio] ([id])
GO
ALTER TABLE [dbo].[fechas_modalidades] CHECK CONSTRAINT [FK_fechas_modalidades_modalidades_estudio]
GO
ALTER TABLE [dbo].[hoja_discapacidades]  WITH CHECK ADD  CONSTRAINT [FK_hoja_discapacidades_discapacidades] FOREIGN KEY([idDiscapacidad])
REFERENCES [dbo].[discapacidades] ([id])
GO
ALTER TABLE [dbo].[hoja_discapacidades] CHECK CONSTRAINT [FK_hoja_discapacidades_discapacidades]
GO
ALTER TABLE [dbo].[hoja_discapacidades]  WITH CHECK ADD  CONSTRAINT [FK_hoja_discapacidades_hojavida] FOREIGN KEY([idHoja])
REFERENCES [dbo].[hojavida] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hoja_discapacidades] CHECK CONSTRAINT [FK_hoja_discapacidades_hojavida]
GO
ALTER TABLE [dbo].[hojadevida_idiomas]  WITH NOCHECK ADD  CONSTRAINT [hojadevida_idiomas$FK_hojadevida_idiomas_escritura] FOREIGN KEY([escritura])
REFERENCES [dbo].[niveles_idiomas] ([id])
GO
ALTER TABLE [dbo].[hojadevida_idiomas] CHECK CONSTRAINT [hojadevida_idiomas$FK_hojadevida_idiomas_escritura]
GO
ALTER TABLE [dbo].[hojadevida_idiomas]  WITH NOCHECK ADD  CONSTRAINT [hojadevida_idiomas$FK_hojadevida_idiomas_habla] FOREIGN KEY([habla])
REFERENCES [dbo].[niveles_idiomas] ([id])
GO
ALTER TABLE [dbo].[hojadevida_idiomas] CHECK CONSTRAINT [hojadevida_idiomas$FK_hojadevida_idiomas_habla]
GO
ALTER TABLE [dbo].[hojadevida_idiomas]  WITH NOCHECK ADD  CONSTRAINT [hojadevida_idiomas$FK_hojadevida_idiomas_hojadevida] FOREIGN KEY([idHoja])
REFERENCES [dbo].[hojavida] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hojadevida_idiomas] CHECK CONSTRAINT [hojadevida_idiomas$FK_hojadevida_idiomas_hojadevida]
GO
ALTER TABLE [dbo].[hojadevida_idiomas]  WITH NOCHECK ADD  CONSTRAINT [hojadevida_idiomas$FK_hojadevida_idiomas_idiomas] FOREIGN KEY([idIdioma])
REFERENCES [dbo].[idiomas] ([id])
GO
ALTER TABLE [dbo].[hojadevida_idiomas] CHECK CONSTRAINT [hojadevida_idiomas$FK_hojadevida_idiomas_idiomas]
GO
ALTER TABLE [dbo].[hojadevida_idiomas]  WITH NOCHECK ADD  CONSTRAINT [hojadevida_idiomas$FK_hojadevida_idiomas_lectura] FOREIGN KEY([lectura])
REFERENCES [dbo].[niveles_idiomas] ([id])
GO
ALTER TABLE [dbo].[hojadevida_idiomas] CHECK CONSTRAINT [hojadevida_idiomas$FK_hojadevida_idiomas_lectura]
GO
ALTER TABLE [dbo].[hojavida]  WITH CHECK ADD  CONSTRAINT [FK_hojavida_personas] FOREIGN KEY([idPersona])
REFERENCES [dbo].[personas] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hojavida] CHECK CONSTRAINT [FK_hojavida_personas]
GO
ALTER TABLE [dbo].[modalidad_evaluacion]  WITH NOCHECK ADD  CONSTRAINT [modalidad_evaluacion$FK_modalidad_evaluacion] FOREIGN KEY([idModalidad])
REFERENCES [dbo].[modalidades] ([id])
GO
ALTER TABLE [dbo].[modalidad_evaluacion] CHECK CONSTRAINT [modalidad_evaluacion$FK_modalidad_evaluacion]
GO
ALTER TABLE [dbo].[modalidad_evaluacion]  WITH NOCHECK ADD  CONSTRAINT [modalidad_evaluacion$FK_modalidad_evaluacion2] FOREIGN KEY([idEvaluacion])
REFERENCES [dbo].[evaluaciones] ([id])
GO
ALTER TABLE [dbo].[modalidad_evaluacion] CHECK CONSTRAINT [modalidad_evaluacion$FK_modalidad_evaluacion2]
GO
ALTER TABLE [dbo].[municipios]  WITH NOCHECK ADD  CONSTRAINT [municipios$FK_municipios_departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[departamentos] ([id])
GO
ALTER TABLE [dbo].[municipios] CHECK CONSTRAINT [municipios$FK_municipios_departamento]
GO
ALTER TABLE [dbo].[novedades]  WITH NOCHECK ADD  CONSTRAINT [novedades$FK_Novedades_usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuarios] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[novedades] CHECK CONSTRAINT [novedades$FK_Novedades_usuarios]
GO
ALTER TABLE [dbo].[ofertas]  WITH CHECK ADD  CONSTRAINT [FK_Ofertas_Experiencias] FOREIGN KEY([idExperiencia])
REFERENCES [dbo].[experiencias] ([id])
GO
ALTER TABLE [dbo].[ofertas] CHECK CONSTRAINT [FK_Ofertas_Experiencias]
GO
ALTER TABLE [dbo].[ofertas]  WITH CHECK ADD  CONSTRAINT [FK_ofertas_municipios] FOREIGN KEY([idMunicipio])
REFERENCES [dbo].[municipios] ([id])
GO
ALTER TABLE [dbo].[ofertas] CHECK CONSTRAINT [FK_ofertas_municipios]
GO
ALTER TABLE [dbo].[ofertas]  WITH NOCHECK ADD  CONSTRAINT [ofertas$FK_Ofertas_Contratos] FOREIGN KEY([idContrato])
REFERENCES [dbo].[contratos] ([id])
GO
ALTER TABLE [dbo].[ofertas] CHECK CONSTRAINT [ofertas$FK_Ofertas_Contratos]
GO
ALTER TABLE [dbo].[ofertas]  WITH NOCHECK ADD  CONSTRAINT [ofertas$FK_Ofertas_Estado] FOREIGN KEY([estado])
REFERENCES [dbo].[estado_ofertas] ([id])
GO
ALTER TABLE [dbo].[ofertas] CHECK CONSTRAINT [ofertas$FK_Ofertas_Estado]
GO
ALTER TABLE [dbo].[ofertas]  WITH NOCHECK ADD  CONSTRAINT [ofertas$FK_ofertas_salarios] FOREIGN KEY([idSalario])
REFERENCES [dbo].[salarios] ([id])
GO
ALTER TABLE [dbo].[ofertas] CHECK CONSTRAINT [ofertas$FK_ofertas_salarios]
GO
ALTER TABLE [dbo].[ofertas]  WITH NOCHECK ADD  CONSTRAINT [ofertas$FK_Ofertas_sede] FOREIGN KEY([idSede])
REFERENCES [dbo].[sedes] ([id])
GO
ALTER TABLE [dbo].[ofertas] CHECK CONSTRAINT [ofertas$FK_Ofertas_sede]
GO
ALTER TABLE [dbo].[ofertas]  WITH NOCHECK ADD  CONSTRAINT [ofertas$FK_ofertas_tipoofertas] FOREIGN KEY([idTipo])
REFERENCES [dbo].[tipoofertas] ([id])
GO
ALTER TABLE [dbo].[ofertas] CHECK CONSTRAINT [ofertas$FK_ofertas_tipoofertas]
GO
ALTER TABLE [dbo].[ofertas]  WITH NOCHECK ADD  CONSTRAINT [ofertas$FK_Ofertas_usuario] FOREIGN KEY([idJefe])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[ofertas] CHECK CONSTRAINT [ofertas$FK_Ofertas_usuario]
GO
ALTER TABLE [dbo].[ofertas_programas]  WITH NOCHECK ADD  CONSTRAINT [ofertas_programas$FK_Ofertas_programas] FOREIGN KEY([idOferta])
REFERENCES [dbo].[ofertas] ([id])
GO
ALTER TABLE [dbo].[ofertas_programas] CHECK CONSTRAINT [ofertas_programas$FK_Ofertas_programas]
GO
ALTER TABLE [dbo].[ofertas_programas]  WITH NOCHECK ADD  CONSTRAINT [ofertas_programas$FK_Ofertas_programas_dependencias] FOREIGN KEY([idDependencia])
REFERENCES [dbo].[dependencias] ([id])
GO
ALTER TABLE [dbo].[ofertas_programas] CHECK CONSTRAINT [ofertas_programas$FK_Ofertas_programas_dependencias]
GO
ALTER TABLE [dbo].[paz_salvos]  WITH CHECK ADD  CONSTRAINT [FK_paz_salvos_dependencias] FOREIGN KEY([idDependencia])
REFERENCES [dbo].[dependencias] ([id])
GO
ALTER TABLE [dbo].[paz_salvos] CHECK CONSTRAINT [FK_paz_salvos_dependencias]
GO
ALTER TABLE [dbo].[persona_tipocorreos]  WITH CHECK ADD  CONSTRAINT [FK_persona_tipocorreos_personas] FOREIGN KEY([idPersona])
REFERENCES [dbo].[personas] ([id])
GO
ALTER TABLE [dbo].[persona_tipocorreos] CHECK CONSTRAINT [FK_persona_tipocorreos_personas]
GO
ALTER TABLE [dbo].[persona_tipocorreos]  WITH CHECK ADD  CONSTRAINT [FK_persona_tipocorreos_tipocorreos] FOREIGN KEY([idTipocorreo])
REFERENCES [dbo].[tipocorreos] ([id])
GO
ALTER TABLE [dbo].[persona_tipocorreos] CHECK CONSTRAINT [FK_persona_tipocorreos_tipocorreos]
GO
ALTER TABLE [dbo].[personas]  WITH CHECK ADD  CONSTRAINT [FK_personas_municipios] FOREIGN KEY([ciudadResidencia])
REFERENCES [dbo].[municipios] ([id])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [FK_personas_municipios]
GO
ALTER TABLE [dbo].[personas]  WITH CHECK ADD  CONSTRAINT [FK_personas_tipo_documentos] FOREIGN KEY([tipodoc])
REFERENCES [dbo].[tipo_documentos] ([id])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [FK_personas_tipo_documentos]
GO
ALTER TABLE [dbo].[personas]  WITH NOCHECK ADD  CONSTRAINT [personas$FK_Personas_EstadoCivil] FOREIGN KEY([idEstadoCivil])
REFERENCES [dbo].[estadocivil] ([id])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [personas$FK_Personas_EstadoCivil]
GO
ALTER TABLE [dbo].[personas]  WITH NOCHECK ADD  CONSTRAINT [personas$FK_Personas_Genero] FOREIGN KEY([idGenero])
REFERENCES [dbo].[genero] ([id])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [personas$FK_Personas_Genero]
GO
ALTER TABLE [dbo].[personas]  WITH NOCHECK ADD  CONSTRAINT [personas$FK_personas_municipios] FOREIGN KEY([ciudadOrigen])
REFERENCES [dbo].[municipios] ([id])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [personas$FK_personas_municipios]
GO
ALTER TABLE [dbo].[postulados]  WITH CHECK ADD  CONSTRAINT [FK_postulados_personas] FOREIGN KEY([idPersona])
REFERENCES [dbo].[personas] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[postulados] CHECK CONSTRAINT [FK_postulados_personas]
GO
ALTER TABLE [dbo].[postulados]  WITH NOCHECK ADD  CONSTRAINT [postulados$FK_Postulados] FOREIGN KEY([idOferta])
REFERENCES [dbo].[ofertas] ([id])
GO
ALTER TABLE [dbo].[postulados] CHECK CONSTRAINT [postulados$FK_Postulados]
GO
ALTER TABLE [dbo].[postulados]  WITH NOCHECK ADD  CONSTRAINT [postulados$FK_Postulados_estadoEmpresa] FOREIGN KEY([idEstatoEmpresa])
REFERENCES [dbo].[estadopostulados] ([id])
GO
ALTER TABLE [dbo].[postulados] CHECK CONSTRAINT [postulados$FK_Postulados_estadoEmpresa]
GO
ALTER TABLE [dbo].[postulados]  WITH NOCHECK ADD  CONSTRAINT [postulados$FK_Postulados_estudianteAprobacion] FOREIGN KEY([idEstadoEstudiante])
REFERENCES [dbo].[estadopostuladosestudiante] ([id])
GO
ALTER TABLE [dbo].[postulados] CHECK CONSTRAINT [postulados$FK_Postulados_estudianteAprobacion]
GO
ALTER TABLE [dbo].[practicas_tutores]  WITH NOCHECK ADD  CONSTRAINT [practicas_tutores$FK_practicas_tutores] FOREIGN KEY([idPracticas])
REFERENCES [dbo].[estudiantes_modalidades] ([id])
GO
ALTER TABLE [dbo].[practicas_tutores] CHECK CONSTRAINT [practicas_tutores$FK_practicas_tutores]
GO
ALTER TABLE [dbo].[practicas_tutores]  WITH NOCHECK ADD  CONSTRAINT [practicas_tutores$FK_practicas_tutores2] FOREIGN KEY([idTutor])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[practicas_tutores] CHECK CONSTRAINT [practicas_tutores$FK_practicas_tutores2]
GO
ALTER TABLE [dbo].[pregunta_respuesta]  WITH NOCHECK ADD  CONSTRAINT [pregunta_respuesta$FK_pregunta_respuesta] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[preguntas] ([id])
GO
ALTER TABLE [dbo].[pregunta_respuesta] CHECK CONSTRAINT [pregunta_respuesta$FK_pregunta_respuesta]
GO
ALTER TABLE [dbo].[pregunta_respuesta]  WITH NOCHECK ADD  CONSTRAINT [pregunta_respuesta$FK_pregunta_respuesta2] FOREIGN KEY([idRespuesta])
REFERENCES [dbo].[posibles_respuestas] ([id])
GO
ALTER TABLE [dbo].[pregunta_respuesta] CHECK CONSTRAINT [pregunta_respuesta$FK_pregunta_respuesta2]
GO
ALTER TABLE [dbo].[preguntas]  WITH NOCHECK ADD  CONSTRAINT [preguntas$FK_preguntas] FOREIGN KEY([idSeccion])
REFERENCES [dbo].[secciones] ([id])
GO
ALTER TABLE [dbo].[preguntas] CHECK CONSTRAINT [preguntas$FK_preguntas]
GO
ALTER TABLE [dbo].[preguntas]  WITH NOCHECK ADD  CONSTRAINT [preguntas$FK_preguntas2] FOREIGN KEY([idTipoPregunta])
REFERENCES [dbo].[tipo_pregunta] ([id])
GO
ALTER TABLE [dbo].[preguntas] CHECK CONSTRAINT [preguntas$FK_preguntas2]
GO
ALTER TABLE [dbo].[proceso_grado]  WITH CHECK ADD  CONSTRAINT [FK_proceso_grado_estudiantes] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[estudiantes] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[proceso_grado] CHECK CONSTRAINT [FK_proceso_grado_estudiantes]
GO
ALTER TABLE [dbo].[proceso_grado]  WITH CHECK ADD  CONSTRAINT [FK_proceso_grado_fechas_de_grado] FOREIGN KEY([idFecha])
REFERENCES [dbo].[fechas_de_grado] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[proceso_grado] CHECK CONSTRAINT [FK_proceso_grado_fechas_de_grado]
GO
ALTER TABLE [dbo].[referencias]  WITH NOCHECK ADD  CONSTRAINT [referencias$FK_referencias_hojadevida] FOREIGN KEY([idHoja])
REFERENCES [dbo].[hojavida] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[referencias] CHECK CONSTRAINT [referencias$FK_referencias_hojadevida]
GO
ALTER TABLE [dbo].[referencias]  WITH NOCHECK ADD  CONSTRAINT [referencias$FK_Referencias_Parentesco] FOREIGN KEY([parentesco])
REFERENCES [dbo].[parentesco] ([id])
GO
ALTER TABLE [dbo].[referencias] CHECK CONSTRAINT [referencias$FK_Referencias_Parentesco]
GO
ALTER TABLE [dbo].[responde]  WITH NOCHECK ADD  CONSTRAINT [responde$FK_responde] FOREIGN KEY([idRespuesta])
REFERENCES [dbo].[pregunta_respuesta] ([id])
GO
ALTER TABLE [dbo].[responde] CHECK CONSTRAINT [responde$FK_responde]
GO
ALTER TABLE [dbo].[responde]  WITH NOCHECK ADD  CONSTRAINT [responde$FK_Responde2] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[responde] CHECK CONSTRAINT [responde$FK_Responde2]
GO
ALTER TABLE [dbo].[responde]  WITH NOCHECK ADD  CONSTRAINT [responde$FK_Responde3] FOREIGN KEY([idEvaluado])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[responde] CHECK CONSTRAINT [responde$FK_Responde3]
GO
ALTER TABLE [dbo].[responde]  WITH NOCHECK ADD  CONSTRAINT [responde$FK_Responde4] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[preguntas] ([id])
GO
ALTER TABLE [dbo].[responde] CHECK CONSTRAINT [responde$FK_Responde4]
GO
ALTER TABLE [dbo].[secciones]  WITH NOCHECK ADD  CONSTRAINT [secciones$FK_secciones] FOREIGN KEY([idPadre])
REFERENCES [dbo].[secciones] ([id])
GO
ALTER TABLE [dbo].[secciones] CHECK CONSTRAINT [secciones$FK_secciones]
GO
ALTER TABLE [dbo].[secciones]  WITH NOCHECK ADD  CONSTRAINT [secciones$FK_secciones2] FOREIGN KEY([idEvaluacion])
REFERENCES [dbo].[evaluaciones] ([id])
GO
ALTER TABLE [dbo].[secciones] CHECK CONSTRAINT [secciones$FK_secciones2]
GO
ALTER TABLE [dbo].[sedes]  WITH NOCHECK ADD  CONSTRAINT [sedes$FK_Sede_empresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[empresas] ([id])
GO
ALTER TABLE [dbo].[sedes] CHECK CONSTRAINT [sedes$FK_Sede_empresa]
GO
ALTER TABLE [dbo].[sedes]  WITH NOCHECK ADD  CONSTRAINT [sedes$FK_Sede_municipio] FOREIGN KEY([idMunicipio])
REFERENCES [dbo].[municipios] ([id])
GO
ALTER TABLE [dbo].[sedes] CHECK CONSTRAINT [sedes$FK_Sede_municipio]
GO
ALTER TABLE [dbo].[sedes]  WITH NOCHECK ADD  CONSTRAINT [sedes$FK_sedes_tiposedes] FOREIGN KEY([idTipoSede])
REFERENCES [dbo].[tiposedes] ([id])
GO
ALTER TABLE [dbo].[sedes] CHECK CONSTRAINT [sedes$FK_sedes_tiposedes]
GO
ALTER TABLE [dbo].[usuario_novedad]  WITH NOCHECK ADD  CONSTRAINT [usuario_novedad$FK_usuario_novedad] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuarios] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usuario_novedad] CHECK CONSTRAINT [usuario_novedad$FK_usuario_novedad]
GO
ALTER TABLE [dbo].[usuarios]  WITH NOCHECK ADD  CONSTRAINT [usuarios$FK_personas_usuarios] FOREIGN KEY([idPersona])
REFERENCES [dbo].[personas] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [usuarios$FK_personas_usuarios]
GO
ALTER TABLE [dbo].[usuarios]  WITH NOCHECK ADD  CONSTRAINT [usuarios$FK_usuarios_roles] FOREIGN KEY([idRol])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [usuarios$FK_usuarios_roles]
GO
ALTER TABLE [dbo].[usuarios]  WITH NOCHECK ADD  CONSTRAINT [usuarios$FK_usuarios_sedes] FOREIGN KEY([idSede])
REFERENCES [dbo].[sedes] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [usuarios$FK_usuarios_sedes]
GO
ALTER TABLE [dbo].[visitas]  WITH NOCHECK ADD  CONSTRAINT [visitas$FK_visitas] FOREIGN KEY([idPractica])
REFERENCES [dbo].[estudiantes_modalidades] ([id])
GO
ALTER TABLE [dbo].[visitas] CHECK CONSTRAINT [visitas$FK_visitas]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.acta_renovacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'acta_renovacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.actividades_economicas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'actividades_economicas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.archivos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'archivos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.asistencias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'asistencias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.cartas_prensentacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cartas_prensentacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.categorias_archivos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'categorias_archivos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.competencias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'competencias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.competencias_hojadevida' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'competencias_hojadevida'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.conferencia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'conferencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.conferenciaprograma' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'conferenciaprograma'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.conferencias_periodos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'conferencias_periodos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.contratos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contratos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.convenios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'convenios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.coordinador_programas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'coordinador_programas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.departamentos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'departamentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.dependencias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dependencias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.empresas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.estado_cartas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'estado_cartas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.estado_convenio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'estado_convenio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.estado_ofertas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'estado_ofertas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.estado_practicas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'estado_practicas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.estadocivil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'estadocivil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.estadoempresas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'estadoempresas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.estadopostulados' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'estadopostulados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.estadopostuladosestudiante' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'estadopostuladosestudiante'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.estudiantes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'estudiantes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.estudiantes_modalidades' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'estudiantes_modalidades'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.estudiosrealizados' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'estudiosrealizados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.evaluaciones' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'evaluaciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.experiencias_laborales' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'experiencias_laborales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.genero' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'genero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.hojadevida_idiomas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hojadevida_idiomas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.hojavida' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hojavida'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.idiomas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'idiomas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.modalidad_evaluacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'modalidad_evaluacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.modalidades' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'modalidades'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.municipios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'municipios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.niveles_idiomas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'niveles_idiomas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.noticias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'noticias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.novedades' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'novedades'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.ofertas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ofertas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.ofertas_programas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ofertas_programas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.paises' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'paises'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.parentesco' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parentesco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.periodos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'periodos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.personas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'personas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.posibles_respuestas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'posibles_respuestas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.postulados' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'postulados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.practicas_tutores' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'practicas_tutores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.pregunta_respuesta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pregunta_respuesta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.preguntas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preguntas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.referencias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'referencias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.responde' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'responde'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.roles' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'roles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.salarios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'salarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.secciones' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'secciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.sedes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sedes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.tipo_pregunta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipo_pregunta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.tipodependencias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipodependencias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.tipoempleador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipoempleador'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.tipoestudiantes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipoestudiantes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.tiponit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tiponit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.tipoofertas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipoofertas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.tiposedes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tiposedes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.usuario_novedad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario_novedad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.usuarios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'egresados.visitas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'visitas'
GO
USE [master]
GO
ALTER DATABASE [Egresados] SET  READ_WRITE 
GO
