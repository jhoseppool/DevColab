Feature: Emparejamiento automatico inteligente para Pair Programming

Como estudiante de ingenieria quiero un sistema de emparejamiento automatico basado en filtros tecnicos para encontrar un companiero de programacion compatible de forma inmediata sin perder tiempo.

  Scenario Outline: E01: Emparejamiento exitoso segun lenguaje y nivel de dificultad

    Given que el estudiante se encuentra autenticado en DevColab
    When el usuario hace clic en el boton "Iniciar Emparejamiento" con lenguaje "<lenguaje>" y dificultad "<dificultad>"
    Then el sistema encuentra un companiero compatible en el pool de usuarios activos

    Examples:
      | lenguaje | dificultad  |
      | Python   | Intermedio  |
      | C++      | Basico      |
      | Java     | Avanzado    |
      | SQL      | Basico      |

  Scenario Outline: E02: No se encuentran usuarios disponibles por filtros especificos

    Given que el desarrollador ha iniciado el proceso de emparejamiento de forma correcta
    When transcurren mas de "<tiempo>" segundos sin encontrar coincidencia con lenguaje "<lenguaje>"
    Then el sistema detiene la busqueda automatica para evitar el bucle infinito

    Examples:
      | lenguaje | tiempo |
      | Java     | 60     |
      | C#       | 60     |
      | Python   | 60     |

Feature: Editor de codigo colaborativo y sincronizado en el navegador

Como usuario miembro de una sala de desarrollo quiero que los cambios en el archivo de codigo se transmitan instantaneamente para mantener la sincronizacion durante la sesion de Pair Programming.

  Scenario Outline: E01: Sincronizacion de sintaxis en tiempo real entre dos programadores

    Given que dos usuarios se encuentran dentro de la sala de codificacion colaborativa
    When el programador principal escribe "<codigo>" en su pantalla
    Then el editor del companiero secundario se actualiza automaticamente reflejando el texto en menos de "<latencia>" ms

    Examples:
      | codigo                        | latencia |
      | int main() { return 0; }      | 800      |
      | def main(): pass              | 800      |
      | public static void main(){}   | 800      |

  Scenario Outline: E02: Error de red al intentar ingresar al entorno sincrono

    Given que un estudiante ha seleccionado una sala de codigo activa en su panel
    When intenta hacer clic en "Unirse al codigo" con estado de red "<estado_red>"
    Then el sistema "<resultado>"

    Examples:
      | estado_red          | resultado                                              |
      | sin conexion        | bloquea el intento de apertura del compilador          |
      | conexion inestable  | muestra advertencia de reconexion automatica           |
      | conexion activa     | permite el ingreso al entorno colaborativo             |

Feature: Registro de progreso academico y metricas analiticas

Como estudiante quiero visualizar mis metricas de progreso por lenguaje y sesion para hacer seguimiento a mi desarrollo tecnico dentro de la plataforma.

  Scenario Outline: E01: Visualizacion de metricas por lenguaje tras multiples sesiones

    Given que el usuario ha completado sesiones con "<lenguaje>" esta semana
    When accede al modulo de progreso tecnico
    Then el sistema muestra "<desafios>" desafios completados y "<horas>" horas invertidas

    Examples:
      | lenguaje | desafios | horas |
      | Python   | 3        | 4.5   |
      | C++      | 1        | 1.5   |
      | Java     | 2        | 3.0   |

  Scenario Outline: E02: Actualizacion del historial segun resultado del desafio

    Given que dos estudiantes finalizaron una sesion con resultado "<resultado>"
    When el compilador valida los casos de prueba
    Then el sistema registra "<accion>" y otorga "<puntos>" puntos de experiencia

    Examples:
      | resultado     | accion                                        | puntos |
      | 100% correcto | aniade el desafio al historial completo       | 100    |
      | 80% correcto  | aniade el desafio con observaciones           | 70     |
      | 0% correcto   | no aniade el desafio y muestra sugerencias    | 0      |

Feature: Seguridad y rendimiento de la plataforma

Como administrador del sistema quiero garantizar que la plataforma opere de forma segura y eficiente bajo distintas condiciones de red y carga para proteger los datos de los usuarios.

  Scenario Outline: E01: Verificacion del protocolo de seguridad segun tipo de dato

    Given que el usuario se encuentra en una sesion activa de pair programming
    When el sistema transmite datos de tipo "<tipo_dato>"
    Then el canal utiliza el protocolo "<protocolo>" con cifrado "<cifrado>"

    Examples:
      | tipo_dato            | protocolo | cifrado  |
      | cambios en editor    | WSS       | TLS 1.3  |
      | mensajes de chat     | WSS       | TLS 1.3  |
      | datos de perfil      | HTTPS     | TLS 1.3  |

  Scenario Outline: E02: Comportamiento ante perdida de conexion de distinta duracion

    Given que el estudiante esta en medio de un reto algoritmico activo
    When la conexion cae durante "<duracion>" segundos
    Then el sistema muestra el estado "<estado>" y realiza "<intentos>" intentos de reconexion

   Examples:
      | duracion | estado             | intentos |
      | 5        | Reconectando...    | 5        |
      | 15       | Reconectando...    | 5        |
      | 60       | Sesion finalizada  | 5        |
