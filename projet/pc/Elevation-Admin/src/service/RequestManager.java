package service;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import com.google.gson.Gson;

import exception.NotAuthentificatedException;
import exception.NotAuthorizedException;
import exception.UnknownRequestException;
import exception.UnreachableServerException;

/**
 * Class as Service. Handles all the request from the controllers to the server.
 */
public class RequestManager {
	private static final String SERVER_URL = "https://132.207.89.31:443/";
	private static final String BASE_URL = "admin/";
	private static final int CONNECTION_TIMEOUT_MS = 4000;
	
	/**
	 * Initializes the request manager
	 */
	public static void initialize() {
		acceptSelfSignedCertificates();
	}
	
	/**
	 * Get request, from the REST API, to the server
	 * @param urlRoute URL route for the resource of the server
	 * @param ResponseClass Class of the response to fill the JSON in
	 * @return Object in the format of the ResponseClass
	 * @throws UnknownRequestException Thrown for HTTP error 400
	 * @throws NotAuthentificatedException Thrown for HTTP error 401
	 * @throws NotAuthorizedException Thrown for HTTP error 403
	 * @throws UnreachableServerException Thrown for HTTP error 500
	 */
	public static Object get(String urlRoute, Class<?> ResponseClass) throws UnknownRequestException, NotAuthentificatedException, NotAuthorizedException, UnreachableServerException {
		
		URL url;
		Object response = null;
				
		try {
			url = new  URL(SERVER_URL + BASE_URL + urlRoute);
			
			HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
			
			connection.setRequestMethod("GET");
			connection.setConnectTimeout(CONNECTION_TIMEOUT_MS);
			
			response = handleServerResponse(ResponseClass, url, connection);
			
		} catch (MalformedURLException e) {
			throw new UnreachableServerException();
		} catch (IOException e) {
			throw new UnreachableServerException();
		}

		return response;
	}
	
	/**
	 * Post request, from the REST API, to the server
	 * @param urlRoute URL route for the resource of the server
	 * @param requestObject Object to send to the server which will be transformed in JSON
	 * @param ResponseClass Class of the response to fill the JSON in
	 * @return Object in the format of the ResponseClass
	 * @throws UnknownRequestException Thrown for HTTP error 400
	 * @throws NotAuthentificatedException Thrown for HTTP error 401
	 * @throws NotAuthorizedException Thrown for HTTP error 403
	 * @throws UnreachableServerException Thrown for HTTP error 500
	 */
	public static Object post(String urlRoute, Object requestObject, Class<?> ResponseClass) throws UnknownRequestException, NotAuthentificatedException, NotAuthorizedException, UnreachableServerException {
		
		URL url;
		Object response = null;
		
		try {
			url = new  URL(SERVER_URL + BASE_URL + urlRoute);
			
			HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();

			connection.setRequestMethod("POST");
			connection.setConnectTimeout(CONNECTION_TIMEOUT_MS);
			
			handleServerRequest(requestObject, connection);
			response = handleServerResponse(ResponseClass, url, connection);
			
		} catch (MalformedURLException e) {
			throw new UnreachableServerException();
		} catch (IOException e) {
			throw new UnreachableServerException();
		}

		return response;
	}

	/**
	 * Handles the server request for a post request
	 * @param requestObject Object to send to the server which will be transformed in JSON
	 * @param connection Connection established with the server
	 * @throws IOException Thrown when the request can't send the byte stream
	 */
	private static void handleServerRequest(Object requestObject, HttpsURLConnection connection) throws IOException {
		Gson gson = new Gson();
		byte[] requestBody = gson.toJson(requestObject).getBytes(StandardCharsets.UTF_8);
		
		connection.setDoOutput(true);

		try (DataOutputStream outputWriter = new DataOutputStream(connection.getOutputStream())) {
			outputWriter.write(requestBody);
		}
	}

	/**
	 * Handles the server response from both get and post requests
	 * @param ResponseClass Class of the response to fill the JSON in
	 * @param url Request URL
	 * @param connection Connection established with the server
	 * @return Object in the format of the ResponseClass
	 * @throws IOException Thrown when the request can't receive the byte stream
	 * @throws UnknownRequestException Thrown for HTTP error 400
	 * @throws NotAuthentificatedException Thrown for HTTP error 401
	 * @throws NotAuthorizedException Thrown for HTTP error 403
	 */
	private static Object handleServerResponse(Class<?> ResponseClass, URL url, HttpsURLConnection connection) throws IOException, UnknownRequestException, NotAuthentificatedException, NotAuthorizedException {
		
		Object response = null;
		
		switch(connection.getResponseCode()) {
			case 200:
				Gson gson = new Gson();
				if (ResponseClass != null) {
					Reader reader = new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8);
					response = gson.fromJson(reader, ResponseClass);
					reader.close();
				}
				break;
			case 400:
				throw new UnknownRequestException();
			case 401:
				throw new NotAuthentificatedException();
			case 403:
				throw new NotAuthorizedException();
			default:
				throw new UnknownRequestException();
		}

		return response;
	}
	
	/**
	 * Accept self signed certificates from the server
	 */
	private static void acceptSelfSignedCertificates() {
		TrustManager[] trustAllCerts = new TrustManager[] {new X509TrustManager() {
			public java.security.cert.X509Certificate[] getAcceptedIssuers() {
				return null;
			}
			public void checkClientTrusted(X509Certificate[] certs, String authType) {
			}
			public void checkServerTrusted(X509Certificate[] certs, String authType) {
			}
		}
		};	

		SSLContext sslContext = null;
		try {
			sslContext = SSLContext.getInstance("SSL");
			sslContext.init(null, trustAllCerts, new java.security.SecureRandom());
		} catch (NoSuchAlgorithmException | KeyManagementException e1) {
			e1.printStackTrace();
		}

		HttpsURLConnection.setDefaultSSLSocketFactory(sslContext.getSocketFactory());

		HostnameVerifier allHostsValid = new HostnameVerifier() {
			public boolean verify(String hostname, SSLSession session) {
				return true;
			}
		};

		HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
	}
}
