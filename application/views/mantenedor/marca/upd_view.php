<form id="frmMarcaUpd" action="#" class="form-horizontal">
    <input type="hidden" id="txtidmarca" name="txtidmarca" class="form-control" value="<?php echo $editarMarca[0]['nMarId'] ?>">
    <div class="form-group">
        <label class="col-sm-2 control-label">Nombre</label>

        <div class="col-sm-10">
            <input type="text" id="txtnombremarca" name="txtnombremarca" class="form-control" value="<?php echo $editarMarca[0]['cMarDescripcion'] ?>">
        </div>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Estado</label>

        <div class="col-sm-10">
            <select class="form-control m-b" name="cboestado" id="cboestado">
                <?php if ($editarMarca[0]['cMarEstado'] == 1) { ?>
                    <option value="1" selected="true">Activo</option>
                    <option value="0">Inactivo</option>
                <?php } else { ?>
                    <option value="0" selected="true">Inactivo</option>
                    <option value="1">Activo</option>
                <?php } ?>
            </select>
        </div>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="form-group">
        <div class="col-sm-4 col-sm-offset-2">
            <button class="btn btn-white" onclick="listarMarca()">Cancelar</button>
            <input class="btn btn-primary" type="button" value="Guardar" onclick="editarGuardar()">
        </div>
    </div>
</form>
