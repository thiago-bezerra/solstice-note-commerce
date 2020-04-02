package br.com.solstice.notecommerce.controller.command.impl;

import br.com.solstice.notecommerce.controller.command.AbstractCommand;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;

public class SaveCommand extends AbstractCommand {

	@Override
	public Result execute(Entity entity, String operation) {
		return facade.save(entity);
	}

}
