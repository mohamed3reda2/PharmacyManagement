   M S B A M L   `   `   `  ����M  IPharmacyManagement, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:PharmacyManagementPharmacyManagement  5   	       PharmacyManagement.POS   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:PharmacyManagement     5   	     � Title$	  POS��5   	   $	��500��6   $	��850��6"   .��5	      �  � RowDefinitions 5
   
   �� 5      $	��13* �6   �� 5      ��5   
   �� 5       �� ImageSource$ /حقن.jpg��6   .+�5   
   �� -   5         ��Name$ 
tabControl��5      ���	#00000000.@�5      �� -   5         ��Name$
 buyh��5   $   $	��buy��6   .��5      � .+�5      &   System.Windows.Controls.DataGrid  -   5          Name$ dataview��5   ;      AutoGenerateColumns .  $	��700��6M   $	��300��6Y   ���	#00000000$��50,93,50,10q�6}      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ 
Product id��61   	   Width5  /System.Windows.Controls.DataGridLengthConverter$	 * 6d   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 6E   �� *
Product_id+6d     5      $ Product Name��61   $	 * 6h   
 6G   �� *Product_name+6h     5      $ Stock��61   $	 * 6a   
 6@   �� *stock_Number+6a     5      $ Price��61   $	 * 6Z   
 6@   �� *price+6Z     5      $
 Type��61   $	 * 6`   
 6?   �� *Product_type+6`     5      $ Expiration date��61   $	 * 6n   
 6J   �� *Expiration_date+6n   5      �� 5      -   5         ��Name$	 buy��5      $	��Buy��6*   $��80��68   $��60��6C   $��670,10,44,305q�6O   ���	#000000006�   �� 5        �� Orientation$ 
Horizontal=�6!   $	��Top=�6:   $��
0,22,576,0q�6R   .+�5!      �� -   5        $ m��5!   !   $��30��6,   $��30��68   $��<��6C   ���	#000000006i   �� 5"      -   5        $
 plus��5"   !   $��30��6/   $��30��6;   $��>��6F   ���	#000000006l   �� 5#      -   5         ��Name$ 	labelview��5#   B   $��label��6    $��10,0,0,0q�60   6B   5%      �� 5&      -   5         ��Name$ cmbCustomerName��5&       �� DisplayMemberPath$ 	user_name��68    �� SelectedValuePath$ User_id��6V   $��422,17,228,359q�6�   5'      5(      �� 5)      -	   5        $
 user��5)   $   $
��user��6   .��5*      � .+�5+      �� -
   5         ��Name$ 	usernamet��5+   +   $��0��6   $	��200��6>   $��70��6J   $��35(�6V   $��300,79,300,285q�6d   ���	#000000006|   �� 5,      -   5        $ Pathological_condition��5,   +   $��1��6   $	��200��6K   $��70��6W   $��35(�6c   $��300,154,300,210q�6q   ���	#000000006�   �� 5-      -   5        $ login��5-   8   $��2��6   $��29(�6*   $��create��6G   $	��100��6X   $��60��6d   $��350,282,350,92q�6p   ���	#00000000���	#FF0900006�   	� 5.      -   5         	�Name$ radio��5.   Q   $��Loyalty��6"   $��Center=�64   $��29��6`   $��	0,229,0,0q�6l   $	��Top=�6   $	��144��6�   $��20(�6�   50      51      �� 52      -   5        $ admin��52   %   $��admin��6   .��53      � .+�54      �� -   5        $	 add��54   8   $��1��6   $��29(�6*   $	��ADD��6E   $��441,10,219,321q�6S   ���	#00000000���	#FF0900006�   �� 55      -   5        $ Update��55   8   $��2��6   $��29(�6*   $��UPDATE��6H   $��596,10,42,321q�6Y   ���	#00000000���	#FF0900006�     57      -   5        $
 edit��57   ;    .  $	��700��6I   $	��300��6U   ���	#00000000$��47,65,47,10q�6y    58        59      $ 
Product id��61   $	 * 6d   
 6E   �� *
Product_id+6d     5:      $ Product Name��61   $	 * 6h   
 6G   �� *Product_name+6h     5;      $ Stock��61   $	 * 6a   
 6@   �� *stock_Number+6a     5<      $ Price��61   $	 * 6Z   
 6@   �� *price+6Z     5=      $
 Type��61   $	 * 6`   
 6?   �� *Product_type+6`     5>      $ Expiration date��61   $	 * 6n   
 6J   �� *Expiration_date+6n   5@      �� 5A      -   5        $ editname��5A      $
��Name��60   $
��Left=�6<   $��22��6W   $��	195,5,0,0q�6c    �� TextWrapping$
 Wrap=�6v   $	��Top=�6�   $��90��6�   �� 5B      -   5        $ 	editstock��5B      $	��Qty��61   $
��Left=�6<   $��22��6W   $��60,5,0,0q�6c   $
 Wrap=�6u   $	��Top=�6�   $��90��6�   �� 5C      -   5        $ 	editprice��5C      $��price��61   $
��Left=�6>   $��22��6Y   $��
195,32,0,0q�6e   $
 Wrap=�6y   $	��Top=�6�   $��90��6�   (  "System.Windows.Controls.DatePicker  5D      -   5          Name$ editdate��5D   !   $
��Left=�63   $��
195,59,0,0q�6N   $	��Top=�6b    J� RenderTransformOrigin$ 0.505,0.864&�6z   $��90��6�   �� 5E      -   5        $
 type��5E      $
��type��6,   $
��Left=�68   $��22��6S   $��	60,32,0,0q�6_   $
 Wrap=�6r   $	��Top=�6�   $��90��6�   5F      5G      �� 5H      -   5        $
 show��5H   $   $
��show��6   .��5I      � .+�5J      �� -   5        $ reports��5J   8   $��4��6   $��29(�6*   $��show report��6I   $��159,11,443,319q�6_   ���	#00000000���	#FF0900006�   �� 5K      -   5        $ sales��5K   8   $��5��6   $��29(�6*   $��
show sales��6G   $��571,10,44,321q�6\   ���	#00000000���	#FF0900006�   �� 5L      -   5        $ expenses��5L   8   $��6��6   $��29(�6*   $��show expenses��6J   $��356,11,228,320q�6b   ���	#00000000���	#FF0900006�     5M      -   5        $ viewinfo��5M       $	��700��62   $	��300��6>   ���	#00000000$��50,93,50,10q�6b   6�   �� 5N      -   5        $ newrep��5N   8   $��7��6   $��20(�6*   $��
new report��6H   $��31,11,640,319q�6]   ���	#00000000���	#FF0900006�   5O      5P      5Q      5S      5T      