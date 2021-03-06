USE [sigpi]
GO
/****** Object:  StoredProcedure [shm_inc].[USP_INC_I_AMBIENTE]    Script Date: 16/10/2014 0:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [shm_inc].[USP_INC_I_AMBIENTE]
	@tipoambiente VARCHAR(100)
	,@ambiente VARCHAR(100)
	,@descripcion VARCHAR(100)
	,@error INT OUT
AS
SET NOCOUNT ON

BEGIN TRANSACTION

BEGIN TRY
	INSERT INTO [shm_inc].[AMBIENTE] (
		[cTipoAmbiente]
		,[cAmbiente]
		,[cAmbDescripcion]
		,[cAmbEstado]
		)
	VALUES (
		@tipoambiente
		,@ambiente
		,@descripcion
		,1
		)

	SET @error = 1

	COMMIT TRANSACTION
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION

	SET @error = 0
END CATCH

GO
/****** Object:  StoredProcedure [shm_inc].[USP_INC_S_AMBIENTE]    Script Date: 16/10/2014 0:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [shm_inc].[USP_INC_S_AMBIENTE] @tipo VARCHAR(100)
	,@idambiente INT
AS
IF @tipo = 'qry_all'
BEGIN
	SELECT nAmbId
		,cAmbiente
		,cAmbDescripcion
		,cTipoAmbiente
		,CASE cAmbEstado
			WHEN 1
				THEN '<i class="fa fa-arrow-circle-o-up"></i> ACTIVO'
			ELSE '<i class="fa fa-arrow-circle-o-down"></i> INACTIVO'
			END AS estado
	FROM shm_inc.AMBIENTE
END

IF @tipo = 'qry_id'
BEGIN
	SELECT nAmbId
		,cAmbiente
		,cAmbDescripcion
		,cTipoAmbiente
		,CASE cAmbEstado
			WHEN 1
				THEN 'ACTIVO'
			ELSE 'INACTIVO'
			END AS estado
	FROM shm_inc.AMBIENTE
	WHERE nAmbId = @idambiente
END

GO
/****** Object:  Table [shm_inc].[AMBIENTE]    Script Date: 16/10/2014 0:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO