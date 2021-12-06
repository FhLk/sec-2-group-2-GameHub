// Write Arrow Functions with Parameters
// เช่นเดียวกับฟังก์ชันปกติ คุณสามารถส่งผ่าน arguments ไปยัง arrow function ได้

// const doubler = (item) => item * 2;
// doubler(4);
// doubler(4) จะคืนค่า 8

// ถ้า arrow function มี parameter เดียว วงเล็บรอบ parameter อาจไม่ต้องมีก็ได้

// const doubler = item => item * 2;
// เป็นไปได้ที่จะส่งผ่าน argument มากกว่าหนึ่งค่าเข้าไปยัง arrow function

// const multiplier = (item, multi) => item * multi;
// multiplier(4, 2);
// multiplier(4, 2) จะคืนค่า 8

// จงปรับแก้ฟังก์ชัน myConcat ซึ่งนำ arr2 มาต่อท้าย arr1 โดยใช้ arrow function
const myConcat = (arr1, arr2) =>  {
    "use strict";
    return arr1.concat(arr2);
  };
  
  console.log(myConcat([1, 2], [3, 4, 5]));
  