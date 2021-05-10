public class Token{
    public String id;
    public String contenido;

    public Token(String id,String contenido){
        this.id = id;
        this.contenido = contenido;
    }

    public String toString(){
        return "\nid="+ id +" "+contenido;
    }
}