import 'package:bloc/bloc.dart';
import 'package:fatem_users/Core/constance.dart';
import 'package:fatem_users/Features/Home/Presentation/Controller/Cubits/Products/products_states.dart';
import '../../../../../Products/data/models/product_model.dart';




class ProductsCubit extends Cubit<ProductsStates>
{
  ProductsCubit() : super(ProductsInitialState());

  List<ProductModel> favoritesList = [];
  List<ProductModel> bagList = [];
  Set<int> favoritesIndex = <int>{};


  void bagAdd(ProductModel product)
  {
    bagList.add(product);
    emit(ProductAdded());
  }

  void bagRemove(ProductModel productModel)
  {
    if(bagList.contains(productModel))
    {
        bagList.remove(productModel);
        emit(ProductRemoved());
    }
  }


  void favoriteAddOrRemove(ProductModel product, int index)
  {
    if(favoritesIndex.contains(index))
    {
        favoritesIndex.remove(index);
        favoritesList.remove(product);

        emit(FavoritesItemRemoved());
    }
    else
    {
        favoritesIndex.add(index);
        favoritesList.add(product);

        emit(FavoritesItemAdded());
    }
  }


  void favoriteRemoved(ProductModel product)
  {
    if(tempProduct!.contains(product))
    {
      int index = tempProduct!.indexOf(product);

      if(favoritesIndex.contains(index))
      {
        favoritesIndex.remove(index);
      }
    }

    favoritesList.remove(product);

    emit(FavoritesItemRemoved());
  }
}
