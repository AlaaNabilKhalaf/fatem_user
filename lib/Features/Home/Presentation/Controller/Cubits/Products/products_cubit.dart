import 'package:bloc/bloc.dart';
import 'package:fatem_users/Core/constance.dart';
import '../../../../../Products/data/models/product_model.dart';
import 'favorites_states.dart';




class ProductsCubit extends Cubit<ProductsStates>
{
  ProductsCubit() : super(ProductsInitialState());

  List<ProductModel> favoritesList = [];
  List<ProductModel> bagList = [];
  Set<int> favoritesIndex = <int>{};


  void bagAddOrRemove(ProductModel product)
  {
    bagList.add(product);
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
