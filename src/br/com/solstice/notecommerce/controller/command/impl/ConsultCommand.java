package br.com.solstice.notecommerce.controller.command.impl;

import br.com.solstice.notecommerce.controller.command.AbstractCommand;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.Result;

public class ConsultCommand extends AbstractCommand {

	@Override
	public Result execute(DomainEntity entity, String operation) {
		return facade.consult(entity, operation);
	}

}