package project.aboutPet.log.service;

//사용자 정의 예외 클래스 
public class ServiceException extends RuntimeException{

	public ServiceException( String message ) {
		super(message);
	}

	public ServiceException( String message , Exception e ) {
		super(message, e);
	}

}