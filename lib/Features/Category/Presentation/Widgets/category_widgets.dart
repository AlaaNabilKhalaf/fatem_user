import 'package:fatem_users/Features/Category/Data/category_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constance.dart';
import '../../../Home/Presentation/Controller/Cubits/Products/products_cubit.dart';
import '../../../Home/Presentation/Controller/Cubits/Products/products_states.dart';
import '../../../Home/Presentation/Widgets/home_widgets.dart';





class CategoryGrid extends StatelessWidget {

  const CategoryGrid({
    super.key,
    required this.categoriesEnum,
  });

  final CategoriesEnum categoriesEnum;

  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<ProductsCubit,ProductsStates>(
        builder: (context, state)
        {
          final cubit = BlocProvider.of<ProductsCubit>(context);
          final products = tempProduct!.where((element) => element.category == categoriesEnum).toList();
          return Expanded(
            child: GridView.builder(
              clipBehavior: Clip.antiAlias,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 65.h),
              itemCount: products.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                mainAxisExtent: 184.h,
              ),
              itemBuilder: (BuildContext context, int index)
              {
                final ind = tempProduct!.indexOf(products[index]);
                return ItemCard(productModel: tempProduct![ind], cubit: cubit, index: ind);
              },
            ),
          );
        }
    );
  }

}
