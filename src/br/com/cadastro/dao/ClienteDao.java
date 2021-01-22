package br.com.cadastro.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.cadastro.conexao.ConnectionFactory;
import br.com.cadastro.modelo.Cliente;


public class ClienteDao {
	private Connection connection;

	public ClienteDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public ClienteDao(Connection connection) {
		this.connection = connection;
	}
	
	
	public void adicionar(Cliente cliente) {
		try {
			String sql = "insert into cliente (nome, cpf, dataNascimento, telefone, email, nomePai, nomeMae) values(?,?,?,?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1,cliente.getNome());
			stmt.setInt(2,cliente.getCpf());
			stmt.setDate(3, new Date(cliente.getDataNascimento().getTimeInMillis()));	
			stmt.setInt(4,cliente.getTelefone());
			stmt.setString(5,cliente.getEmail());
			stmt.setString(6,cliente.getNomePai());
			stmt.setString(7,cliente.getNomeMae());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			
			throw new RuntimeException(e);
		}
		
	}
	
	
	public List<Cliente> listar() {
		try {
			List<Cliente> clientes = new ArrayList<Cliente>();
			PreparedStatement stmt = this.connection.prepareStatement("select * from cliente");

			ResultSet rs = stmt.executeQuery();

			while(rs.next()) {
				
				Cliente cliente = new Cliente();
				
				cliente.setId(rs.getLong("id"));
				cliente.setNome(rs.getString("nome"));
				cliente.setCpf(rs.getInt("cpf"));
				
				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("dataNascimento"));
				cliente.setDataNascimento(data);
				
				cliente.setTelefone(rs.getInt("telefone"));
				cliente.setEmail(rs.getString("email"));
				cliente.setNomePai(rs.getString("nomePai"));
				cliente.setNomeMae(rs.getString("nomeMae"));

				clientes.add(cliente);
				
			}

			rs.close();
			stmt.close();

			return clientes;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	
	public void excluir(Cliente cliente) {
		
		String sql = "delete from cliente where id=?";
		
		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setLong(1, cliente.getId());
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public void atualizar(Cliente cliente) {
		
		try {
			String sql = "update cliente set nome = ?, cpf = ?, dataNascimento = ?, telefone = ?, email = ?, nomePai = ?, nomeMae = ? where id = ?";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			
			stmt.setString(1, cliente.getNome());
			stmt.setInt(2, cliente.getCpf());
			stmt.setDate(3, new java.sql.Date(cliente.getDataNascimento().getTimeInMillis()));
			stmt.setInt(4,cliente.getTelefone());
			stmt.setString(5,cliente.getEmail());
			stmt.setString(6,cliente.getNomePai());
			stmt.setString(7,cliente.getNomeMae());
			stmt.setLong(8, cliente.getId());
			
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	public Cliente buscaPorId(Long id) {

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from cliente where id = ?");
			stmt.setLong(1, id);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				return populaTarefa(rs);
			}

			rs.close();
			stmt.close();

			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	

	private Cliente populaTarefa(ResultSet rs) throws SQLException {
		Cliente cliente = new Cliente();

		cliente.setId(rs.getLong("id"));
		cliente.setNome(rs.getString("nome"));
		cliente.setCpf(rs.getInt("cpf"));
		
		cliente.setTelefone(rs.getInt("telefone"));
		cliente.setEmail(rs.getString("email"));
		cliente.setNomePai(rs.getString("nomePai"));
		cliente.setNomeMae(rs.getString("nomeMae"));
		
		Date data = rs.getDate("dataNascimento");
		
		if (data != null) {
			Calendar dataNascimento = Calendar.getInstance();
			dataNascimento.setTime(data);
			cliente.setDataNascimento(dataNascimento);
		}
		return cliente;
	}
		
}
