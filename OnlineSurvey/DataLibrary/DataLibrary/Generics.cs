using System;

namespace BusinessLogicLayer
{
   public class Generics
    {
        public static int GetNumber()
        {
            Random ram = new Random();
            return ram.Next(1000, 9999);
        }
    }
}
