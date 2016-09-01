<?php
	$hfoot=0;
	$hinch=0;

function notnegative($numero){
	$respuesta=0;	
	if (!($numero >= 0)){
		$respuesta=-1;
	}
	return $respuesta;
} //verifica que el numero no sea negativo

function foot2inch($numero_foot){
	return $numero_foot *12;		
} //convierte el valor de pies a pulgadas y lo guarda en una variable

function inch2cm($num_inches){
		return $num_inches * 2.54;
} //convierte el valor total de pulgadas a centimetros.

function main () {
		$regreso=0;
	do{
		echo "ingrese la altura en pies: ";
		$foot=fgets(STDIN);
		if (notnegative($foot)==0) 
		{
			echo "\n ingrese el valor decimal en pulgadas: ";
			$inch=fgets(STDIN);
			if (notnegative($inch)==0)
			{
					$inches=foot2inch($foot);
					$centimeters=inch2cm($inch+$inches);
					echo "La altura de la persona ingresada en centimetros es: $centimeters \n";
			}
			else
			{
					echo "Ha ingresado un valor negativo";
					$regreso=-1;		
					break;
			} 
		}
		else 
		{
				echo "Ha ingresado un valor negativo";
				$regreso=-1;
				break;
		}
	} while ($regreso<0);		
} //function principal para que funcione el programa en general;
		
main();
?>
