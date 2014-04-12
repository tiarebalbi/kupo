package com.tiarebalbi.kupo.configuration.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.tiarebalbi.kupo.models.TipoUsuario;
import com.tiarebalbi.kupo.models.Usuario;

/**
 * Objeto de verificação dos dados das permissões de cada usuário
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.configuration.security
 * @since 1.0.0
 * 
 */
public class KupoUserDetail implements UserDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Usuario usuario;
	
	/**
	 * Construtor
	 */
	public KupoUserDetail() {
		super();
	}
	
	/**
	 * @param usuario Entidade do usuário a ser logado
	 */
	public KupoUserDetail(Usuario usuario) {
		this.usuario = usuario;
	}
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<SimpleGrantedAuthority> listAuthorities = new ArrayList<>();
		if(usuario.getTipo().equals(TipoUsuario.ROOT)) {
			listAuthorities.add(new SimpleGrantedAuthority(TipoUsuario.ROOT.getRole()));	
		}else if(usuario.getTipo().equals(TipoUsuario.ASSINANTE)) {
			listAuthorities.add(new SimpleGrantedAuthority(TipoUsuario.ASSINANTE.getRole()));
		}else if(usuario.getTipo().equals(TipoUsuario.FUNCIONARIO)) {
			listAuthorities.add(new SimpleGrantedAuthority(TipoUsuario.FUNCIONARIO.getRole()));
		}
		
		return listAuthorities;
	}

	@Override
	public String getPassword() {
		return this.usuario.getSenha();
	}

	@Override
	public String getUsername() {
		return this.usuario.getLogin();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		return this.usuario.getStatus();
	}
	
	/**
	 * @return {@link Usuario}
	 */
	public Usuario getUsuario() {
		return this.usuario;
	}
	
	/**
	 * @param usuario {@link Usuario}
	 */
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
