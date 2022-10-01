## Respuestas

1. Aporte de los mensajes de DD
- En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?
La información que aporta cada llamado desde una clase puntual, es el tipo de clase del objeto que envia el mensaje.

2. Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?
- Lo mejor para instanciar un objeto es en la clase que define al objeto en cuestión, ya que es quien conoce la estructura y requerimientos del propio objeto. En caso que se cree el objeto en diferentes lugares, esto habla de posibles problemas con el encapsulamiento. Se solucionaria aprovechando el polimorfismo en los mensajes de creación o con modificaciones al modelo, logrando un mejor encapsulamiento.

3. Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?
- En este dominio especifico del problema, tenemos categorias predefinidas, dadas por el contexto, pero todo lo que queda afuera de este dominio se categoriza como "parte" de mensajes para double dispatch (dd). 

4. Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?
- Esto se hace cuando el mensaje en cuestión es necesario para todas las subclases y es implementado de forma diferente por cada una de ellas. Esto se hace para que cuando creamos una nueva subclase, si no lo implementamos, va a avisarnos que falta esta implementación, ya que se ejecutará el error de Subclass Responsibility. A su vez sirve para conocer las responsabilidades que tiene cada subclase.

5. No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?
- Uno de los principales problemas de romper encapsulamiento es que hay objetos que tendrían responsabilidades en nuestro modelo, que no coinciden con las interacciones del dominio que estamos modelando. Por otro lado, genera un gran acomplamiento del modelo, que limita las abstraciones a una sola implementación, quitando el sentido de las abstracciones logradas.