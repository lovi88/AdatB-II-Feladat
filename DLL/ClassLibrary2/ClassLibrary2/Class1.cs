using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using RGiesecke.DllExport;

namespace ClassLibrary2
{

    public class Class1
    {
        [DllExport("Szumma", CallingConvention = CallingConvention.StdCall)]
        public static int Szumma(int a, int b) {
            return a + b;
        }

    }
}
