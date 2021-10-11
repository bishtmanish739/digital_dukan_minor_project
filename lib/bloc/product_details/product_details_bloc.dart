import 'package:bloc/bloc.dart';
import 'package:digital_dukan_minor_project/models/product.dart';
import 'package:digital_dukan_minor_project/repository/product_details_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsRepo productDetailsRepo;
  ProductDetailsBloc(this.productDetailsRepo) : super(ProductDetailsInitial()) {
    on<ProductDetailsEvent>((event, emit) async {
      if (event is UpdateProductDetails) {
        try {
          emit(ProductDetailsLoading());
          productDetailsRepo.validate(event.product);
          String location =
              await productDetailsRepo.uploadProduct(event.product);
          if(event.image!=null)
          await productDetailsRepo.uploadPic(event.image, location);
          event.product.image = location;
          emit(ProductDetailsLoaded(event.product.image));
        } catch (e) {
          emit(ProductDetailsError(e.toString()));
        }
      }
    });
  }
}
