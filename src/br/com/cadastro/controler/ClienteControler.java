package br.com.cadastro.controler;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.cadastro.dao.ClienteDao;
import br.com.cadastro.modelo.Cliente;



@Controller
public class ClienteControler {
	
	@RequestMapping("index")
	public String form() {
		return "cliente/index";
		
	}
	
	@RequestMapping("adicionarCliente")
	public String adicionar(Cliente cliente) {
		ClienteDao dao = new ClienteDao();
		dao.adicionar(cliente);
		return "cliente/adicionado";
	}
	
	@RequestMapping("listaDeCliente")
	public String listar(Model model) {
		ClienteDao dao = new ClienteDao();
		model.addAttribute("cliente", dao.listar());
		return "cliente/listaDeCliente";
		
	}
	
	@RequestMapping("excluirCliente")
	public String excluir(Cliente cliente) {
		ClienteDao dao = new ClienteDao();
		dao.excluir(cliente);
		return "redirect:listaDeCliente";
	}
	
	@RequestMapping("editarCliente")
	public String mostrar(Long id, Model model) {
		ClienteDao dao = new ClienteDao();
		model.addAttribute("cliente", dao.buscaPorId(id));
		return "cliente/editarCliente";
	}
	
	@RequestMapping("atualizarCliente")
	public String atualizar(Cliente cliente) {
		ClienteDao dao = new ClienteDao();
		dao.atualizar(cliente);
		return "redirect:listaDeCliente";
	}

}
