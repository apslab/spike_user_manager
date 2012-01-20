SSO: Autenticación y autorización
---------------------------------

### Ideas

1. La autenticación debe ser centralizadas (Single SignOn)
2. La autorización queda en control de cada aplicación, aunque se puede el componente de autenticación puede gestionar el acceso a las demás aplicaciones (solo a groso modo).
3. El usuario se crea en el autenticador y se le da acceso para determinada aplicación.
4. Los roles se agregan o revocan desde cada aplicación.

### Diagrama de interacción
#### Entre los sistemas para autenticarse

![](https://github.com/apslab/spike_user_manager/raw/master/doc/diagram.png)
